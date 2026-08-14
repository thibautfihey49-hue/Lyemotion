package com.gpsauto

import android.Manifest
import android.content.Intent
import android.content.SharedPreferences
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat

class MainActivity : AppCompatActivity() {
    private lateinit var prefs: SharedPreferences
    private lateinit var etNumero: EditText
    private lateinit var btnStart: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        prefs = getSharedPreferences("GPS_SMS", MODE_PRIVATE)
        etNumero = findViewById(R.id.et_numero)
        btnStart = findViewById(R.id.btn_start)
        etNumero.setText(prefs.getString("num", "+33748107513"))
        
        btnStart.setOnClickListener {
            if (LocationService.isRunning) {
                stopService(Intent(this, LocationService::class.java))
                Toast.makeText(this, "🛑 Arrêté", Toast.LENGTH_SHORT).show()
                btnStart.text = "🚀 Démarrer"
                LocationService.isRunning = false
            } else if (verifierPermissions()) {
                prefs.edit().putString("num", etNumero.text.toString()).apply()
                startForegroundService(Intent(this, LocationService::class.java))
                Toast.makeText(this, "✅ Service démarré !", Toast.LENGTH_LONG).show()
                btnStart.text = "🛑 Arrêter"
                LocationService.isRunning = true
            } else {
                demanderPermissions()
            }
        }
    }

    private fun verifierPermissions() =
        ContextCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS) == PackageManager.PERMISSION_GRANTED &&
        ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED

    private fun demanderPermissions() {
        val perms = mutableListOf(Manifest.permission.SEND_SMS, Manifest.permission.ACCESS_FINE_LOCATION)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) perms.add(Manifest.permission.POST_NOTIFICATIONS)
        ActivityCompat.requestPermissions(this, perms.toTypedArray(), 1)
    }
}
