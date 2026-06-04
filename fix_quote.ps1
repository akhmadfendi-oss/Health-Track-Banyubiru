$text = Get-Content "d:\HEALTHTRACKESNESABA\index.html" -Raw

# 1. Ganti "AUTHENTICATION REQUIRED" dengan div quote yang berubah-ubah
$text = $text.Replace(
    '<h2>AUTHENTICATION REQUIRED</h2>',
    '<h2 id="authQuote" style="font-size:18px; font-style:italic; color:var(--primary-color); line-height:1.6;"></h2>'
)

# 2. Tambahkan script quote randomizer SEBELUM initNutrifoodRain()
$quoteScript = @'
// --- QUOTE MOTIVASI INDONESIA (Random setiap refresh) ---
const INDO_QUOTES = [
  "Sehat hari ini, hebat esok hari.",
  "Satu langkah kecil hari ini, satu lompatan besar ke depan.",
  "Kebiasaan sehat dimulai dari pilihan kecil setiap hari.",
  "Kamu lebih kuat dari alasanmu untuk menyerah.",
  "Tubuh sehat, pikiran jernih, performa maksimal.",
  "Konsistensi adalah kunci keberhasilan.",
  "Jangan tunggu sakit untuk mulai hidup sehat.",
  "Kesehatan adalah investasi terbaik masa depanmu.",
  "Disiplin hari ini, sukses di masa depan.",
  "Mulailah dari dirimu sendiri, mulailah dari hal kecil.",
  "Hidup sehat bukan tujuan, tapi perjalanan.",
  "Yang membedakan pemenang adalah konsistensinya.",
  "Jadilah versi terbaik dari dirimu setiap hari.",
  "Kesehatan tidak bisa dibeli, tapi bisa dijaga.",
  "Hari ini adalah hari terbaik untuk memulai kebiasaan baik."
];
(function setRandomQuote() {
  const q = INDO_QUOTES[Math.floor(Math.random() * INDO_QUOTES.length)];
  const el = document.getElementById("authQuote");
  if (el) el.textContent = '"' + q + '"';
  const el2 = document.getElementById("loginQuote");
  if (el2) el2.textContent = '"' + q + '"';
})();

'@

$text = $text.Replace(
    'initNutrifoodRain();',
    ($quoteScript + 'initNutrifoodRain();')
)

Set-Content "d:\HEALTHTRACKESNESABA\index.html" $text -Encoding UTF8
Write-Host "QUOTE MOTIVASI APPLIED SUCCESSFULLY"
