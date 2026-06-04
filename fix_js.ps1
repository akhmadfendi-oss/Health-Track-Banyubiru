$html = Get-Content d:\HEALTHTRACKESNESABA\index.html -Raw -Encoding UTF8

$badString1 = @"
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
</html>
"@

$goodString1 = @"
      </body>
    </html>
"@

$badString2 = @"
  const postHtml = "<script>
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
</html>";
"@

$goodString2 = @"
  const postHtml = "</body></html>";
"@

$html = $html.Replace($badString1, $goodString1)
$html = $html.Replace($badString2, $goodString2)

Set-Content d:\HEALTHTRACKESNESABA\index.html $html -Encoding UTF8
