# Read as bytes to check BOM
$bytes = [System.IO.File]::ReadAllBytes("d:\HEALTHTRACKESNESABA\index.html")
$hasBOM = ($bytes[0] -eq 239) -and ($bytes[1] -eq 187) -and ($bytes[2] -eq 191)
Write-Host "Has UTF8 BOM: $hasBOM"
Write-Host "File size: $($bytes.Length) bytes"

if ($hasBOM) {
    # Remove BOM by writing without it
    $text = [System.IO.File]::ReadAllText("d:\HEALTHTRACKESNESABA\index.html", [System.Text.Encoding]::UTF8)
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText("d:\HEALTHTRACKESNESABA\index.html", $text, $utf8NoBom)
    Write-Host "BOM REMOVED"
}
