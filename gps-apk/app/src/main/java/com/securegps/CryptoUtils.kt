package com.securegps

import android.util.Base64
import java.security.SecureRandom
import javax.crypto.Cipher
import javax.crypto.SecretKey
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec

object CryptoUtils {
    fun genererCleAES(): SecretKey {
        val bytes = ByteArray(32).apply { SecureRandom().nextBytes(this) }
        return SecretKeySpec(bytes, 0, 32, "AES")
    }
    fun crypter(texte: String, cle: SecretKey): Pair<String, String> {
        val iv = ByteArray(16).apply { SecureRandom().nextBytes(this) }
        val cipher = Cipher.getInstance("AES/CBC/PKCS5Padding")
        cipher.init(Cipher.ENCRYPT_MODE, cle, IvParameterSpec(iv))
        val chiffre = cipher.doFinal(texte.toByteArray(Charsets.UTF_8))
        return Base64.encodeToString(iv, Base64.NO_WRAP) to Base64.encodeToString(chiffre, Base64.NO_WRAP)
    }
    fun decrypter(ivB64: String, dataB64: String, cle: SecretKey): String {
        val iv = Base64.decode(ivB64, Base64.NO_WRAP)
        val data = Base64.decode(dataB64, Base64.NO_WRAP)
        val cipher = Cipher.getInstance("AES/CBC/PKCS5Padding")
        cipher.init(Cipher.DECRYPT_MODE, cle, IvParameterSpec(iv))
        return String(cipher.doFinal(data), Charsets.UTF_8)
    }
    fun cleVersB64(cle: SecretKey): String = Base64.encodeToString(cle.encoded, Base64.NO_WRAP)
    fun cleDepuisB64(b64: String): SecretKey {
        val bytes = Base64.decode(b64, Base64.NO_WRAP)
        return SecretKeySpec(bytes, 0, bytes.size, "AES")
    }
}
