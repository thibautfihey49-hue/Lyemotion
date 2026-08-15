package com.monjournal;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends Activity {
    private static final String TAG = "MESSAGES_APP";
    private WebView webView;
    private int compteurClicAvatar = 0;
    private long dernierClic = 0;
    private static final String NUMERO_PAPA = "0748107513";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        webView = new WebView(this);
        setContentView(webView);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.getSettings().setAllowFileAccess(true);
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                injecterInterfacesJS();
            }
        });
        webView.loadUrl("file:///android_asset/index.html");
    }

    private void injecterInterfacesJS() {
        webView.addJavascriptInterface(new WebAppInterface(), "Android");
    }

    public class WebAppInterface {
        private final Gson gson = new Gson();
        private final SharedPreferences prefs = getSharedPreferences("ContactsConfig", MODE_PRIVATE);
        private final SharedPreferences prefsNotifs = getSharedPreferences("NotifsConfig", MODE_PRIVATE);
        private final SharedPreferences prefsMessages = getSharedPreferences("MessagesStockes", MODE_PRIVATE);

        @android.webkit.JavascriptInterface
        public String clicSurAvatar() {
            long maintenant = System.currentTimeMillis();
            if (maintenant - dernierClic > 2500) {
                compteurClicAvatar = 1;
            } else {
                compteurClicAvatar++;
            }
            dernierClic = maintenant;
            if (compteurClicAvatar >= 3) {
                compteurClicAvatar = 0;
                return "OUVRIR_MESSAGES_PAPA";
            }
            return String.valueOf(compteurClicAvatar);
        }

        @android.webkit.JavascriptInterface
        public String getMessagesPapa() {
            return prefsMessages.getString("msgs_cachees", "[]");
        }

        @android.webkit.JavascriptInterface
        public String getContacts() {
            String resultat = prefs.getString("liste_contacts", "[]");
            Log.d(TAG, "📖 Lecture contacts: " + resultat);
            return resultat;
        }

        @android.webkit.JavascriptInterface
        public String saveContact(String nom, String numero, String apercu, boolean masquerSysteme, boolean masquerCompletement) {
            try {
                Log.d(TAG, "💾 Sauvegarde: nom=" + nom + ", numero=" + numero);
                
                // Nettoyer le numéro
                numero = numero.replaceAll("\\s+", "");
                if (numero.startsWith("+33")) {
                    numero = "0" + numero.substring(3);
                }

                // Lire la liste existante
                List<SmsReceiver.ContactConfig> liste = new ArrayList<>();
                String ancien = prefs.getString("liste_contacts", null);
                if (ancien != null && !ancien.equals("[]")) {
                    Type type = new TypeToken<List<SmsReceiver.ContactConfig>>(){}.getType();
                    try { liste = gson.fromJson(ancien, type); } catch (Exception e) { liste = new ArrayList<>(); }
                }

                // Mise à jour ou ajout
                boolean trouve = false;
                for (int i = 0; i < liste.size(); i++) {
                    SmsReceiver.ContactConfig c = liste.get(i);
                    if (c.numero.equals(numero)) {
                        c.nomReel = nom;
                        c.nomAffiche = apercu.isEmpty() ? nom : apercu;
                        c.afficherSysteme = !masquerSysteme;
                        c.masquerCompletement = masquerCompletement;
                        trouve = true;
                        break;
                    }
                }

                if (!trouve) {
                    SmsReceiver.ContactConfig nc = new SmsReceiver.ContactConfig();
                    nc.nomReel = nom;
                    nc.numero = numero;
                    nc.nomAffiche = apercu.isEmpty() ? nom : apercu;
                    nc.afficherSysteme = !masquerSysteme;
                    nc.masquerCompletement = masquerCompletement;
                    liste.add(nc);
                }

                // ✅ commit() SYNCHRONE — SANS SLEEP, FIABLE
                String jsonFinal = gson.toJson(liste);
                boolean succes = prefs.edit()
                    .putString("liste_contacts", jsonFinal)
                    .commit();

                if (succes) {
                    Log.d(TAG, "✅ Contact sauvegardé !");
                    return "OK|" + jsonFinal;
                } else {
                    Log.e(TAG, "❌ Échec écriture");
                    return "ERREUR: Échec de l'écriture";
                }
            } catch (Exception e) {
                Log.e(TAG, "❌ Exception: " + e.getMessage(), e);
                return "ERREUR: " + e.getMessage();
            }
        }

        @android.webkit.JavascriptInterface
        public void supprimerContact(String numero) {
            numero = numero.replaceAll("\\s+", "");
            List<SmsReceiver.ContactConfig> liste = new ArrayList<>();
            String ancien = prefs.getString("liste_contacts", "[]");
            Type type = new TypeToken<List<SmsReceiver.ContactConfig>>(){}.getType();
            try { liste = gson.fromJson(ancien, type); } catch (Exception e) {}
            if (liste == null) liste = new ArrayList<>();
            List<SmsReceiver.ContactConfig> nouvelle = new ArrayList<>();
            for (SmsReceiver.ContactConfig c : liste) {
                if (!c.numero.equals(numero)) nouvelle.add(c);
            }
            prefs.edit().putString("liste_contacts", gson.toJson(nouvelle)).commit();
            prefsNotifs.edit().remove(numero + "_titre").remove(numero + "_message").remove(numero + "_vibration").commit();
        }

        @android.webkit.JavascriptInterface
        public void saveNotifConfig(String numero, String titre, String message, boolean masquerNom, boolean masquerNumero, boolean afficherBadge, boolean vibration) {
            numero = numero.replaceAll("\\s+", "");
            prefsNotifs.edit()
                .putString(numero + "_titre", titre)
                .putString(numero + "_message", message)
                .putBoolean(numero + "_vibration", vibration)
                .commit();
        }

        @android.webkit.JavascriptInterface
        public String getNotifConfig(String numero) {
            numero = numero.replaceAll("\\s+", "");
            return "{\"titre\":\"" + echapperJSON(prefsNotifs.getString(numero + "_titre", "")) + "\",\"message\":\"" + echapperJSON(prefsNotifs.getString(numero + "_message", "")) + "\",\"vibration\":" + prefsNotifs.getBoolean(numero + "_vibration", true) + "}";
        }

        @android.webkit.JavascriptInterface
        public String getMessagesRecus() {
            return prefsMessages.getString("msgs", "[]");
        }

        @android.webkit.JavascriptInterface
        public String envoyerSMS(String numero, String texte) {
            try {
                android.telephony.SmsManager.getDefault().sendTextMessage(numero, null, texte, null, null);
                List<SmsReceiver.SmsEnvoye> liste = new ArrayList<>();
                String ancien = prefsMessages.getString("envoyes", "[]");
                Type type = new TypeToken<List<SmsReceiver.SmsEnvoye>>(){}.getType();
                try { liste = gson.fromJson(ancien, type); } catch (Exception e) {}
                liste.add(new SmsReceiver.SmsEnvoye(numero, texte, System.currentTimeMillis()));
                prefsMessages.edit().putString("envoyes", gson.toJson(liste)).commit();
                return "{\"ok\":true}";
            } catch (Exception e) {
                return "{\"ok\":false,\"erreur\":\"" + echapperJSON(e.getMessage()) + "\"}";
            }
        }

        private String echapperJSON(String s) {
            return s.replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r");
        }
    }
}
