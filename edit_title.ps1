$html = Get-Content d:\HEALTHTRACKESNESABA\index.html -Raw -Encoding UTF8
$html = $html.Replace('<h1 id="topbarTitle">Program 30 Hari Hidup Sehat</h1>', '<h1 id="topbarTitle">Program 30 Hari Hidup Sehat Bersama</h1>')
$html = $html.Replace('<p id="topbarSubtitle">Bersama SMP NEGERI 1 BANYUBIRU</p>', '<p id="topbarSubtitle">SMP NEGERI 1 BANYUBIRU</p>')
Set-Content d:\HEALTHTRACKESNESABA\index.html $html -Encoding UTF8
