</resources>
EOF

# ==============================================================
# 📄 res/values/themes.xml
# ==============================================================
cat > app/src/main/res/values/themes.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="Theme.Lyemotion" parent="Theme.AppCompat.Light.NoActionBar">
        <item name="colorPrimary">@color/calme</item>
        <item name="android:windowBackground">@color/fond</item>
    </style>
</resources>
EOF

# ==============================================================
# 📄 Icône
# ==============================================================
cat > app/src/main/res/drawable/ic_launcher.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp" android:height="108dp" android:viewportWidth="108" android:viewportHeight="108">
  <path android:fillColor="#43A047" android:pathData="M54,108A54,54 0 1 1 54,0a54,54 0 1 1 0,108zM36,42c0,4.4 -3.6,8 -8,8s-8,-3.6 -8,-8 3.6,-8 8,-8 8,3.6 8,8zM80,42c0,4.4 -3.6,8 -8,8s-8,-3.6 -8,-8 3.6,-8 8,-8 8,3.6 8,8zM78,60c-2,-8 -9.8,-14 -18,-14s-16,6 -18,14c-1,3 1,6 4,7s6,-1 7,-4c1,-4 5,-7 9,-7s8,3 9,7c1,3 4,5 7,4s5,-4 4,-7z"/>
</vector>
EOF

# ==============================================================
# 📄 Layouts
# ==============================================================
cat > app/src/main/res/layout/activity_main.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent" android:layout_height="match_parent"
    android:background="@color/fond" android:orientation="vertical"
    android:gravity="center" android:padding="20dp">

    <TextView android:layout_width="wrap_content" android:layout_height="wrap_content"
        android:text="@string/bonjour" android:textSize="26sp" android:textStyle="bold"
        android:layout_marginBottom="24dp"/>

    <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="horizontal" android:layout_marginBottom="16dp">
        <Button android:id="@+id/btnColere" android:layout_width="0dp" android:layout_height="70dp" android:layout_weight="1" android:layout_margin="6dp" android:backgroundTint="@color/colere" android:text="@string/colere"/>
        <Button android:id="@+id/btnTristesse" android:layout_width="0dp" android:layout_height="70dp" android:layout_weight="1" android:layout_margin="6dp" android:backgroundTint="@color/tristesse" android:text="@string/tristesse"/>
    </LinearLayout>
    <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="horizontal" android:layout_marginBottom="24dp">
        <Button android:id="@+id/btnJoie" android:layout_width="0dp" android:layout_height="70dp" android:layout_weight="1" android:layout_margin="6dp" android:backgroundTint="@color/joie" android:textColor="@color/texte" android:text="@string/joie"/>
        <Button android:id="@+id/btnPeur" android:layout_width="0dp" android:layout_height="70dp" android:layout_weight="1" android:layout_margin="6dp" android:backgroundTint="@color/peur" android:text="@string/peur"/>
    </LinearLayout>

    <TextView android:text="--- Mes outils ---" android:textSize="18sp" android:layout_margin="16dp"/>

    <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="horizontal" android:layout_marginBottom="12dp">
        <Button android:id="@+id/btnDefouloir" android:layout_width="0dp" android:layout_height="80dp" android:layout_weight="1" android:layout_margin="6dp" android:backgroundTint="@color/colere" android:text="@string/defouloir" android:textStyle="bold"/>
        <Button android:id="@+id/btnDessin" android:layout_width="0dp" android:layout_height="80dp" android:layout_weight="1" android:layout_margin="6dp" android:backgroundTint="@color/tristesse" android:text="@string/dessin" android:textStyle="bold"/>
    </LinearLayout>
    <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="horizontal" android:layout_marginBottom="12dp">
        <Button android:id="@+id/btnVoix" android:layout_width="0dp" android:layout_height="80dp" android:layout_weight="1" android:layout_margin="6dp" android:backgroundTint="@color/calme" android:text="@string/voix" android:textStyle="bold"/>
        <Button android:id="@+id/btnJournal" android:layout_width="0dp" android:layout_height="80dp" android:layout_weight="1" android:layout_margin="6dp" android:backgroundTint="@color/joie" android:textColor="@color/texte" android:text="@string/journal" android:textStyle="bold"/>
    </LinearLayout>
    <Button android:id="@+id/btnRespirer" android:layout_width="match_parent" android:layout_height="80dp" android:backgroundTint="@color/calme" android:text="@string/respirer" android:textStyle="bold"/>
</LinearLayout>
EOF

cat > app/src/main/res/layout/activity_defouloir.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent" android:layout_height="match_parent"
    android:background="@color/fond" android:id="@+id/fondDefouloir">
    <TextView android:layout_width="match_parent" android:layout_height="wrap_content" android:text="Tape autant que tu veux ! 👊" android:textSize="24sp" android:gravity="center" android:layout_marginTop="40dp"/>
    <TextView android:id="@+id/compteurTaps" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="0" android:textSize="90sp" android:layout_centerInParent="true" android:textColor="@color/colere"/>
    <Button android:id="@+id/btnRetour" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/retour" android:layout_alignParentTop="true" android:layout_margin="16dp"/>
    <Button android:id="@+id/btnReinitialiser" android:layout_width="match_parent" android:layout_height="70dp" android:layout_alignParentBottom="true" android:layout_margin="24dp" android:text="🔄 Recommencer" android:textSize="20sp"/>
</RelativeLayout>
EOF

cat > app/src/main/res/layout/activity_dessin.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent" android:layout_height="match_parent"
    android:background="@color/blanc" android:orientation="vertical">
    <Button android:id="@+id/btnRetourDessin" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/retour" android:layout_margin="8dp"/>
    <com.lyemotion.app.DessinView android:id="@+id/dessinView" android:layout_width="match_parent" android:layout_height="0dp" android:layout_weight="1"/>
    <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="horizontal" android:padding="8dp" android:gravity="center">
        <Button android:id="@+id/c1" android:layout_width="50dp" android:layout_height="50dp" android:backgroundTint="#E53935"/>
        <Button android:id="@+id/c2" android:layout_width="50dp" android:layout_height="50dp" android:backgroundTint="#1E88E5"/>
        <Button android:id="@+id/c3" android:layout_width="50dp" android:layout_height="50dp" android:backgroundTint="#43A047"/>
        <Button android:id="@+id/c4" android:layout_width="50dp" android:layout_height="50dp" android:backgroundTint="#FDD835"/>
        <Button android:id="@+id/c5" android:layout_width="50dp" android:layout_height="50dp" android:backgroundTint="#8E24AA"/>
        <Button android:id="@+id/eff" android:layout_width="50dp" android:layout_height="50dp" android:text="🧹" android:textSize="20sp"/>
    </LinearLayout>
</LinearLayout>
EOF

cat > app/src/main/res/layout/activity_voix.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent" android:layout_height="match_parent"
    android:background="@color/fond" android:orientation="vertical" android:gravity="center" android:padding="24dp">
    <Button android:id="@+id/btnRetourVoix" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/retour" android:layout_gravity="start"/>
    <TextView android:id="@+id/statut" android:text="Appuie pour parler 🎙️" android:textSize="22sp" android:layout_margin="40dp"/>
    <Button android:id="@+id/btnRec" android:layout_width="200dp" android:layout_height="200dp" android:text="🎙️" android:textSize="80sp" android:backgroundTint="@color/calme"/>
    <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="horizontal" android:layout_marginTop="40dp">
        <Button android:id="@+id/btnPlay" android:text="▶️ Écouter" android:layout_margin="8dp" android:enabled="false"/>
        <Button android:id="@+id/btnDel" android:text="🗑️ Supprimer" android:layout_margin="8dp" android:enabled="false"/>
    </LinearLayout>
</LinearLayout>
EOF

cat > app/src/main/res/layout/activity_journal.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent" android:layout_height="match_parent"
    android:background="@color/fond" android:orientation="vertical">
    <Button android:id="@+id/btnRetourJournal" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/retour" android:layout_margin="8dp"/>
    <EditText android:id="@+id/etTexte" android:layout_width="match_parent" android:layout_height="120dp" android:hint="✏️ Ce que je ressens…" android:gravity="top" android:padding="12dp" android:layout_margin="8dp" android:background="@color/blanc"/>
    <Button android:id="@+id/btnAjouter" android:layout_width="match_parent" android:layout_height="60dp" android:text="✅ Ajouter au journal" android:layout_margin="8dp" android:backgroundTint="@color/calme"/>
    <androidx.recyclerview.widget.RecyclerView android:id="@+id/liste" android:layout_width="match_parent" android:layout_height="0dp" android:layout_weight="1" android:padding="8dp"/>
</LinearLayout>
EOF

cat > app/src/main/res/layout/activity_respirer.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent" android:layout_height="match_parent"
    android:background="@color/fond" android:orientation="vertical" android:gravity="center" android:padding="24dp">
    <Button android:id="@+id/btnRetourResp" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/retour" android:layout_gravity="start"/>
    <TextView android:id="@+id/nuage" android:text="☁️" android:textSize="100sp" android:layout_margin="60dp"/>
    <Button android:id="@+id/btnCommencer" android:layout_width="match_parent" android:layout_height="80dp" android:text="🫁 Commencer la respiration" android:textSize="22sp" android:backgroundTint="@color/calme"/>
</LinearLayout>
EOF

cat > app/src/main/res/layout/item_journal.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent" android:layout_height="wrap_content"
    android:orientation="vertical" android:padding="12dp" android:layout_margin="4dp" android:background="@drawable/card_bg">
    <TextView android:id="@+id/tvDate" android:textSize="12sp" android:textColor="#888"/>
    <TextView android:id="@+id/tvEmotion" android:textSize="16sp" android:textStyle="bold" android:layout_marginTop="4dp"/>
    <TextView android:id="@+id/tvTexte" android:textSize="15sp" android:layout_marginTop="4dp"/>
</LinearLayout>
EOF

cat > app/src/main/res/drawable/card_bg.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle">
    <solid android:color="#FFFFFF"/>
    <corners android:radius="12dp"/>
    <stroke android:width="1dp" android:color="#DDDDDD"/>
</shape>
EOF

# ==============================================================
# 📄 Kotlin — Toutes les activités
# ==============================================================
cat > app/src/main/java/com/lyemotion/app/MainActivity.kt <<'EOF'
package com.lyemotion.app

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<Button>(R.id.btnDefouloir).setOnClickListener { startActivity(Intent(this, DefouloirActivity::class.java)) }
        findViewById<Button>(R.id.btnDessin).setOnClickListener { startActivity(Intent(this, DessinActivity::class.java)) }
        findViewById<Button>(R.id.btnVoix).setOnClickListener { startActivity(Intent(this, VoixActivity::class.java)) }
        findViewById<Button>(R.id.btnJournal).setOnClickListener { startActivity(Intent(this, JournalActivity::class.java)) }
        findViewById<Button>(R.id.btnRespirer).setOnClickListener { startActivity(Intent(this, RespirerActivity::class.java)) }
        findViewById<Button>(R.id.btnColere).setOnClickListener { window.decorView.setBackgroundColor(getColor(R.color.colere) and 0x40FFFFFF) }
        findViewById<Button>(R.id.btnTristesse).setOnClickListener { window.decorView.setBackgroundColor(getColor(R.color.tristesse) and 0x40FFFFFF) }
        findViewById<Button>(R.id.btnJoie).setOnClickListener { window.decorView.setBackgroundColor(getColor(R.color.joie) and 0x40FFFFFF) }
        findViewById<Button>(R.id.btnPeur).setOnClickListener { window.decorView.setBackgroundColor(getColor(R.color.peur) and 0x40FFFFFF) }
    }
}
EOF

cat > app/src/main/java/com/lyemotion/app/DefouloirActivity.kt <<'EOF'
package com.lyemotion.app

import android.os.Bundle
import android.widget.Button
import android.widget.RelativeLayout
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class DefouloirActivity : AppCompatActivity() {
    private var compteur = 0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_defouloir)
        val fond = findViewById<RelativeLayout>(R.id.fondDefouloir)
        val compteurTaps = findViewById<TextView>(R.id.compteurTaps)
        fond.setOnClickListener {
            compteur++
            compteurTaps.text = compteur.toString()
            fond.setBackgroundColor(when {
                compteur < 10 -> getColor(R.color.fond)
                compteur < 30 -> getColor(R.color.colere) and 0x30FFFFFF
                else -> getColor(R.color.calme) and 0x50FFFFFF
            })
            if (compteur == 50) compteurTaps.text = "✨ Ça va mieux !"
        }
        findViewById<Button>(R.id.btnReinitialiser).setOnClickListener {
            compteur = 0
            compteurTaps.text = "0"
            fond.setBackgroundColor(getColor(R.color.fond))
        }
        findViewById<Button>(R.id.btnRetour).setOnClickListener { finish() }
    }
}
EOF

cat > app/src/main/java/com/lyemotion/app/DessinView.kt <<'EOF'
package com.lyemotion.app

import android.content.Context
import android.graphics.*
import android.util.AttributeSet
import android.view.MotionEvent
import android.view.View

class DessinView @JvmOverloads constructor(context: Context, attrs: AttributeSet? = null) : View(context, attrs) {
    private val chemin = Path()
    private val paint = Paint().apply {
        color = Color.RED
        style = Paint.Style.STROKE
        strokeJoin = Paint.Join.ROUND
        strokeCap = Paint.Cap.ROUND
        strokeWidth = 12f
        isAntiAlias = true
    }
    private lateinit var bitmap: Bitmap
    private lateinit var canvas: Canvas
    private var lastX = 0f
    private var lastY = 0f

    override fun onSizeChanged(w: Int, h: Int, oldw: Int, oldh: Int) {
        super.onSizeChanged(w, h, oldw, oldh)
        bitmap = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888)
        canvas = Canvas(bitmap)
    }
    override fun onDraw(canvas: Canvas) { canvas.drawBitmap(bitmap, 0f, 0f, null); canvas.drawPath(chemin, paint) }
    override fun onTouchEvent(event: MotionEvent): Boolean {
        val x = event.x; val y = event.y
        when (event.action) {
            MotionEvent.ACTION_DOWN -> { chemin.moveTo(x, y); lastX = x; lastY = y }
            MotionEvent.ACTION_MOVE -> { chemin.quadTo(lastX, lastY, (x + lastX) / 2, (y + lastY) / 2); lastX = x; lastY = y }
            MotionEvent.ACTION_UP -> { canvas.drawPath(chemin, paint); chemin.reset() }
        }
        invalidate(); return true
    }
    fun changerCouleur(c: Int) { paint.color = c }
    fun effacer() { bitmap.eraseColor(Color.WHITE); invalidate() }
}
EOF

cat > app/src/main/java/com/lyemotion/app/DessinActivity.kt <<'EOF'
package com.lyemotion.app

import android.graphics.Color
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class DessinActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_dessin)
        val dv = findViewById<DessinView>(R.id.dessinView)
        findViewById<Button>(R.id.btnRetourDessin).setOnClickListener { finish() }
        findViewById<Button>(R.id.c1).setOnClickListener { dv.changerCouleur(Color.parseColor("#E53935")) }
        findViewById<Button>(R.id.c2).setOnClickListener { dv.changerCouleur(Color.parseColor("#1E88E5")) }
        findViewById<Button>(R.id.c3).setOnClickListener { dv.changerCouleur(Color.parseColor("#43A047")) }
        findViewById<Button>(R.id.c4).setOnClickListener { dv.changerCouleur(Color.parseColor("#FDD835")) }
        findViewById<Button>(R.id.c5).setOnClickListener { dv.changerCouleur(Color.parseColor("#8E24AA")) }
        findViewById<Button>(R.id.eff).setOnClickListener { dv.effacer() }
    }
}
EOF

cat > app/src/main/java/com/lyemotion/app/VoixActivity.kt <<'EOF'
package com.lyemotion.app

import android.Manifest
import android.content.pm.PackageManager
import android.media.MediaPlayer
import android.media.MediaRecorder
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import java.io.File

class VoixActivity : AppCompatActivity() {
    private var recorder: MediaRecorder? = null
    private var player: MediaPlayer? = null
    private lateinit var fichier: File
    private var enCours = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_voix)
        val statut = findViewById<TextView>(R.id.statut)
        val btnRec = findViewById<Button>(R.id.btnRec)
        val btnPlay = findViewById<Button>(R.id.btnPlay)
        val btnDel = findViewById<Button>(R.id.btnDel)
        findViewById<Button>(R.id.btnRetourVoix).setOnClickListener { finish() }
        fichier = File(externalCacheDir, "voix.3gp")

        btnRec.setOnClickListener {
            if (checkSelfPermission(Manifest.permission.RECORD_AUDIO) != android.content.pm.PackageManager.PERMISSION_GRANTED) {
                ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.RECORD_AUDIO), 123)
                return@setOnClickListener
            }
            if (!enCours) {
                recorder = MediaRecorder().apply {
                    setAudioSource(MediaRecorder.AudioSource.MIC)
                    setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP)
                    setOutputFile(fichier.absolutePath)
                    setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB)
                    prepare(); start()
                }
                enCours = true; statut.text = "⏹️ Enregistrement…"; btnRec.text = "⏹️"
                btnPlay.isEnabled = false; btnDel.isEnabled = false
            } else {
                recorder?.apply { stop(); release() }; recorder = null; enCours = false
                statut.text = "✅ Terminé !"; btnRec.text = "🎙️"
                btnPlay.isEnabled = true; btnDel.isEnabled = true
            }
        }
        btnPlay.setOnClickListener {
            player = MediaPlayer().apply { setDataSource(fichier.absolutePath); prepare(); start() }
            statut.text = "🔊 Lecture…"
            player?.setOnCompletionListener { statut.text = "Appuie pour parler 🎙️"; player = null }
        }
        btnDel.setOnClickListener { fichier.delete(); btnPlay.isEnabled = false; btnDel.isEnabled = false; statut.text = "🗑️ Supprimé" }
    }
    override fun onStop() {
        super.onStop()
        recorder?.apply { if (enCours) { stop(); release() } }; recorder = null
        player?.apply { if (isPlaying) { stop(); release() } }; player = null
    }
}
EOF

cat > app/src/main/java/com/lyemotion/app/JournalActivity.kt <<'EOF'
package com.lyemotion.app

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import java.io.File
import java.text.SimpleDateFormat
import java.util.*

data class Entree(val date: String, val emotion: String, val texte: String)

class JournalAdapter(private val liste: MutableList<Entree>) : RecyclerView.Adapter<JournalAdapter.VH>() {
    class VH(v: View) : RecyclerView.ViewHolder(v) {
        val date: TextView = v.findViewById(R.id.tvDate)
        val emotion: TextView = v.findViewById(R.id.tvEmotion)
        val texte: TextView = v.findViewById(R.id.tvTexte)
    }
    override fun onCreateViewHolder(p: ViewGroup, t: Int) = VH(LayoutInflater.from(p.context).inflate(R.layout.item_journal, p, false))
    override fun onBindViewHolder(h: VH, i: Int) { val e = liste[i]; h.date.text = e.date; h.emotion.text = e.emotion; h.texte.text = e.texte }
    override fun getItemCount() = liste.size
}

class JournalActivity : AppCompatActivity() {
    private val fichier by lazy { File(filesDir, "journal.txt") }
    private val entrees = mutableListOf<Entree>()
    private lateinit var adapter: JournalAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_journal)
        findViewById<Button>(R.id.btnRetourJournal).setOnClickListener { finish() }
        val etTexte = findViewById<EditText>(R.id.etTexte)
        val btnAjouter = findViewById<Button>(R.id.btnAjouter)
        val rv = findViewById<RecyclerView>(R.id.liste)
        adapter = JournalAdapter(entrees); rv.adapter = adapter; rv.layoutManager = LinearLayoutManager(this)
        charger()
        btnAjouter.setOnClickListener {
            val txt = etTexte.text.toString().trim()
            if (txt.isNotEmpty()) {
                val date = SimpleDateFormat("dd/MM HH:mm", Locale.FRANCE).format(Date())
                entrees.add(0, Entree(date, "😐 Neutre", txt)); sauvegarder(); adapter.notifyItemInserted(0); etTexte.text.clear()
            }
        }
    }
    private fun charger() { if (fichier.exists()) fichier.bufferedReader().useLines { it.forEach { l -> val p = l.split("|"); if (p.size == 3) entrees.add(Entree(p[0], p[1], p[2])) } } }
    private fun sauvegarder() { fichier.printWriter().use { out -> entrees.forEach { out.println("${it.date}|${it.emotion}|${it.texte}") } } }
}
EOF

cat > app/src/main/java/com/lyemotion/app/RespirerActivity.kt <<'EOF'
package com.lyemotion.app

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class RespirerActivity : AppCompatActivity() {
    private val h = Handler(Looper.getMainLooper())
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_respirer)
        val n = findViewById<TextView>(R.id.nuage)
        findViewById<Button>(R.id.btnRetourResp).setOnClickListener { finish() }
        findViewById<Button>(R.id.btnCommencer).setOnClickListener {
            val et = listOf("☁️ Inspire…", "💨 Retiens…", "🌬️ Souffle…", "✨ C'est parfait ! 😊")
            var i = 0
            fun proch() { if (i < et.size) { n.text = et[i]; n.textSize = if (i == 2) 60f else 100f; i++; h.postDelayed(::proch, 4000) } }
            proch()
        }
    }
    override fun onDestroy() { super.onDestroy(); h.removeCallbacksAndMessages(null) }
}
EOF

# ==============================================================
# 📄 Autres fichiers
# ==============================================================
cat > .gitignore <<'EOF'
*.iml
.gradle
/build/
local.properties
.DS_Store
EOF

cat > README.md <<'EOF'
# 🧸 Lyemotion

Application de gestion des émotions pour enfants avec espace défouloir sécurisé.

## ✨ Fonctionnalités
- 👊 **Défouloir** — Taper l'écran pour évacuer la colère
- 🎨 **Dessin** — Dessiner ses émotions
- 🎙️ **Enregistrement vocal** — Dire ce qui fâche
- 📔 **Journal** — Sauvegarder ses émotions
- 🌬️ **Respiration** — Exercices de calme

## 🔒 Sécurité
- ✅ Sans publicité · ✅ Sans compte · ✅ Hors ligne

## 📲 Télécharger l'APK
Va dans l'onglet **Actions** → clique sur le dernier build → **Artifacts** → télécharge l'APK.
EOF

# ==============================================================
# 📦 Git Commit
# ==============================================================
echo ""
echo "📦 Initialisation du dépôt Git…"
git init -q
git add .
git commit -q -m "Initial commit : Lyemotion complet"
git branch -M main 2>/dev/null || true
echo ""
echo "🔗 Ajout du dépôt distant : $GITHUB_REPO"
git remote remove origin 2>/dev/null || true
git remote add origin "$GITHUB_REPO"
echo ""
echo "=========================================="
echo "✅ PROJET CRÉÉ AVEC SUCCÈS !"
echo ""
echo "👤 Utilisateur : $GITHUB_USER"
echo "📧 Email : $GITHUB_EMAIL"
echo ""
echo "📋 PROCHAINES ÉTAPES :"
echo ""
echo "1️⃣  Pousser le code vers GitHub :"
echo "   cd $PROJECT_NAME"
echo "   git push -u origin main"
echo ""
echo "2️⃣  Si demandé, utilise ton Personal Access Token comme mot de passe :"
echo "   → GitHub → Settings → Developer settings → Personal Access Tokens"
echo ""
echo "3️⃣  Récupérer l'APK compilé automatiquement :"
echo "   → https://github.com/thibautfihey49-hue/Lyemotion/actions"
echo "   → Clique sur le build → Artifacts → Télécharger APK"
echo ""
echo "=========================================="
cd Lyemotion
