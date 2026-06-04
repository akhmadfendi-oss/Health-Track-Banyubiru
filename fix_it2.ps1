$text = Get-Content "d:\HEALTHTRACKESNESABA\index.html" -Raw

# Insert the right logout buttons at the end of student page and teacher page
$studentEnd = '</div>\s*</section>\s*<!-- -+ TEACHER DASHBOARD -+ -->'
$studentEndFix = '</div><button class="btn primary full" onclick="logout()" style="margin-top: 30px; background: #e74c3c; color: white; border: none; font-weight: bold; border-radius: 12px; height: 50px;">[ LOGOUT ]</button></section><!-- --------------------------- TEACHER DASHBOARD --------------------------- -->'
$text = [regex]::Replace($text, $studentEnd, $studentEndFix)

$teacherEnd = '</div>\s*</div>\s*</section>\s*<!-- -+ LAPORAN NPET -+ -->'
$teacherEndFix = '</div></div><button class="btn primary full" onclick="logout()" style="margin-top: 30px; background: #e74c3c; color: white; border: none; font-weight: bold; border-radius: 12px; height: 50px;">[ LOGOUT ]</button></section><!-- --------------------------- LAPORAN NPET --------------------------- -->'
$text = [regex]::Replace($text, $teacherEnd, $teacherEndFix)

Set-Content "d:\HEALTHTRACKESNESABA\index.html" $text
