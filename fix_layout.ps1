$html = Get-Content 'd:\HEALTHTRACKESNESABA\index.html' -Raw -Encoding UTF8

# Replace brand logo with logo.png
$html = $html -replace '<img class="brand-logo"[\s\S]*?>', '<img src="logo.png" alt="Logo Sekolah" style="width: 50px; height: 50px; border-radius: 12px; object-fit: contain;">'

# Replace subtitle to have <br> instead of mojibake
$html = $html -replace '<p>Program 30 Hari Hidup Sehat Bersama.*?</p>', '<p>Program 30 Hari Hidup Sehat Bersama<br>SMP NEGERI 1 BANYUBIRU</p>'

# Remove the redundant loginQuote elements
$html = $html -replace '<div class="hero-emoji" id="loginQuote" [^>]+></div>\s*', ''
$html = $html -replace '<div class="quote" id="loginQuote"[^>]+></div>\s*', ''

# Add GURU to dropdowns
$html = $html -replace '(<option>9F</option>\s*)</select>', "`$1`n            <option>GURU</option>`n          </select>"

# Clean up any leftover '?' mojibakes from earlier agent errors
$html = $html -replace '\?"', '-"'
$html = $html -replace '\? ', '- '

Set-Content 'd:\HEALTHTRACKESNESABA\index.html' $html -Encoding UTF8
Write-Output "Layout fixes applied successfully."
