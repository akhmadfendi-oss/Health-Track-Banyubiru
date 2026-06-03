$html = Get-Content d:\HEALTHTRACKESNESABA\index.html -Raw -Encoding UTF8
$html = $html -replace 'CONNECT AS STUDENT', 'LOGIN AS STUDENT'
$html = $html -replace 'INITIATE DASHBOARD', 'LOGIN AS TEACHER'
Set-Content d:\HEALTHTRACKESNESABA\index.html $html -Encoding UTF8
