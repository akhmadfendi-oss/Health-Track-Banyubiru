$html = Get-Content d:\HEALTHTRACKESNESABA\index.html -Raw -Encoding UTF8

$html = $html -replace 'id="btnSiswa">Siswa</div>', 'id="btnSiswa">User</div>'
$html = $html -replace 'id="btnGuru">Guru</div>', 'id="btnGuru">Admin</div>'
$html = $html -replace 'Masuk sebagai Siswa', 'Masuk sebagai User'
$html = $html -replace 'Masuk sebagai Guru', 'Masuk sebagai Admin'
$html = $html -replace 'LOGIN AS TEACHER', 'LOGIN AS ADMIN'
$html = $html -replace 'GURU2024', 'ESNESABA123OKE'
$html = $html -replace '<option value="">Pilih Kelas</option>', '<option value="">Pilih Kelas</option><option value="GURU">GURU</option>'

Set-Content d:\HEALTHTRACKESNESABA\index.html $html -Encoding UTF8
