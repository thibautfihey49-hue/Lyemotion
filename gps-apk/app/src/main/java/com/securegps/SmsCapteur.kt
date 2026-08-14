package com.securegps

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.core.app.NotificationCompat
import android.telephony.SmsMessage

class SmsCapteur : BroadcastReceiver() {
    override fun onReceive(contexte: Context?, intent: Intent?) {
        if (intent?.action != "android.provider.Telephony.SMS_RECEIVED") return
        abortBroadcast()

        val pdus = intent.extras?.get("pdus") as? Array<*> ?: return
        val corps = pdus.joinToString("") {
            SmsMessage.createFromPdu(it as ByteArray).messageBody
        }
        if (!corps.startsWith("SEC:")) return

        val prefs = contexte?.getSharedPreferences("SecureGPS", Context.MODE_PRIVATE) ?: return
        val cleB64 = prefs.getString("CLE_AES", null) ?: return
        val cle = CryptoUtils.cleDepuisB64(cleB64)

        try {
            val parties = corps.substring(4).split("|")
            if (parties.size < 2) return
            val texteClair = CryptoUtils.decrypter(parties[0], parties[1], cle)
            val expediteur = parties.getOrNull(2) ?: "Inconnu"
            val horodatage = System.currentTimeMillis()

            val msgDB = contexte.getSharedPreferences("Messages", Context.MODE_PRIVATE)
            msgDB.edit().putString("msg_$horodatage", "$expediteur|$texteClair").apply()

            val canalId = "SMS_SECURE"
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                val canal = NotificationChannel(canalId, "SMS Sécurisés", NotificationManager.IMPORTANCE_HIGH)
                contexte.getSystemService(NotificationManager::class.java).createNotificationChannel(canal)
            }

            val notif = NotificationCompat.Builder(contexte, canalId)
                .setContentTitle("🔒 Message Sécurisé")
                .setContentText("De $expediteur — Ouvrir pour lire")
                .setSmallIcon(android.R.drawable.ic_lock_lock)
                .setContentIntent(PendingIntent.getActivity(
                    contexte, 0, Intent(contexte, MainActivity::class.java),
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                ))
                .setAutoCancel(true)
                .build()
            contexte.getSystemService(NotificationManager::class.java).notify(horodatage.toInt(), notif)

            contexte.sendBroadcast(Intent("NOUVEAU_MSG").putExtra("texte", texteClair).putExtra("expediteur", expediteur))
        } catch (_: Exception) {}
    }
}
