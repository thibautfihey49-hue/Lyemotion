package com.gpsauto

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.SharedPreferences
import android.location.Location
import android.os.Build
import android.os.IBinder
import android.telephony.SmsManager
import androidx.core.app.NotificationCompat
import com.google.android.gms.location.*
import kotlin.math.*

class LocationService : Service() {
    companion object {
        var isRunning = false
        private const val CHANNEL = "GPS_SERVICE"
    }

    private lateinit var prefs: SharedPreferences
    private lateinit var fused: FusedLocationProviderClient
    private var lastLat = 0.0
    private var lastLon = 0.0

    override fun onCreate() {
        super.onCreate()
        prefs = getSharedPreferences("GPS_SMS", Context.MODE_PRIVATE)
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            getSystemService(NotificationManager::class.java).createNotificationChannel(
                NotificationChannel(CHANNEL, "GPS SMS", NotificationManager.IMPORTANCE_LOW)
            )
        }
        
        startForeground(1, NotificationCompat.Builder(this, CHANNEL)
            .setContentTitle("📡 GPS SMS Auto")
            .setContentText("Suivi en temps réel actif")
            .setSmallIcon(android.R.drawable.ic_menu_mylocation)
            .setOngoing(true).build())

        fused = LocationServices.getFusedLocationProviderClient(this)
        val req = LocationRequest.Builder(5000).setMinUpdateDistanceMeters(5f).build()
        val cb = object : LocationCallback() {
            override fun onLocationResult(r: LocationResult) {
                r.lastLocation?.let { loc ->
                    if (lastLat == 0.0) {
                        lastLat = loc.latitude
                        lastLon = loc.longitude
                        sendSMS("✅ GPS ACTIF — Service démarré")
                        return
                    }
                    val d = distance(lastLat, lastLon, loc.latitude, loc.longitude)
                    if (d >= 5) {
                        sendSMS("GPS:${loc.latitude},${loc.longitude},${loc.accuracy.toInt()}m")
                        lastLat = loc.latitude
                        lastLon = loc.longitude
                    }
                }
            }
        }
        
        try { fused.requestLocationUpdates(req, cb, null) }
        catch (e: SecurityException) { stopSelf() }
        isRunning = true
    }

    private fun distance(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double {
        val dLat = Math.toRadians(lat2 - lat1)
        val dLon = Math.toRadians(lon2 - lon1)
        val a = sin(dLat/2).pow(2) + cos(Math.toRadians(lat1)) * cos(Math.toRadians(lat2)) * sin(dLon/2).pow(2)
        return 6371000 * 2 * atan2(sqrt(a), sqrt(1-a))
    }

    private fun sendSMS(msg: String) {
        val num = prefs.getString("num", "+33748107513")!!
        try { SmsManager.getDefault().sendTextMessage(num, null, msg, null, null) }
        catch (e: Exception) {}
    }

    override fun onDestroy() {
        super.onDestroy()
        fused.removeLocationUpdates(object : LocationCallback(){})
        isRunning = false
    }

    override fun onBind(i: Intent): IBinder? = null
}
