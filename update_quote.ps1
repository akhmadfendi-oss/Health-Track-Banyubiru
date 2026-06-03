$html = Get-Content d:\HEALTHTRACKESNESABA\index.html -Raw -Encoding UTF8

# Replace LOGIN_PORTAL with a dynamic quote container
$html = $html -replace '<div class="hero-emoji">\[ LOGIN_PORTAL \]</div>', '<div class="hero-emoji" id="loginQuote" style="font-size: 16px; font-style: italic; white-space: normal; padding: 0 10px; line-height: 1.5; color: var(--primary-color); font-weight: 600;"></div>'

# Remove logout from topbar
$html = $html -replace '<button class="pill" onclick="logout\(\)">\[ LOGOUT \]</button>', ''

# Add logout button below the quote in Siswa Dashboard
$html = $html -replace '<div class="quote" style="margin-top:16px;">> "Sehat hari ini, hebat esok hari."</div>', '<div class="quote" style="margin-top:16px;">> "Sehat hari ini, hebat esok hari."</div><button class="btn primary full" onclick="logout()" style="margin-top: 15px; background: #e74c3c; color: white; border: none; font-weight: bold; border-radius: 12px; height: 50px;">[ LOGOUT ]</button>'

# Add logout button at the bottom of Guru Dashboard
$html = $html -replace '<div class="notice">Data ini bersifat konfidensial untuk monitoring kesehatan internal.</div>', '<div class="notice">Data ini bersifat konfidensial untuk monitoring kesehatan internal.</div><button class="btn primary full" onclick="logout()" style="margin-top: 15px; background: #e74c3c; color: white; border: none; font-weight: bold; border-radius: 12px; height: 50px;">[ LOGOUT ]</button>'

# Inject the JS for the random quote before the closing </body> tag
$js = @"
<script>
document.addEventListener("DOMContentLoaded", () => {
  const INDO_QUOTES = [
    "Sehat hari ini, hebat esok hari.",
    "Satu langkah kecil hari ini, satu lompatan besar ke depan.",
    "Kebiasaan sehat dimulai dari pilihan kecil setiap hari.",
    "Kamu lebih kuat dari alasanmu untuk menyerah.",
    "Tubuh sehat, pikiran jernih, performa maksimal.",
    "Konsistensi adalah kunci keberhasilan.",
    "Jangan tunggu sakit untuk mulai hidup sehat.",
    "Kesehatan adalah investasi terbaik masa depanmu."
  ];
  const loginQuoteEl = document.getElementById("loginQuote");
  if (loginQuoteEl) {
    loginQuoteEl.textContent = '"' + INDO_QUOTES[Math.floor(Math.random() * INDO_QUOTES.length)] + '"';
  }
});
</script>
</body>
"@
$html = $html -replace '</body>', $js

Set-Content d:\HEALTHTRACKESNESABA\index.html $html -Encoding UTF8
