$b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes('C:\Users\ASUS A407UA\.gemini\antigravity\brain\68e6fccd-7e98-4387-a33f-1ae8c293dba2\media__1780517990616.png'))
$html = Get-Content index.html -Raw -Encoding UTF8
$dataUri = 'data:image/png;base64,' + $b64.Trim()
$replacement = '<img class="brand-logo" style="background:transparent; padding:0; object-fit:cover; border-radius:50%;" src="' + $dataUri + '">'
$html = $html.Replace('<div class="brand-logo">HT</div>', $replacement)
Set-Content index.html $html -Encoding UTF8
