$text = Get-Content "d:\HEALTHTRACKESNESABA\index.html" -Raw

# Clean up the injected script tag which might be causing issues
$pattern = '(?s)<script>\s*document\.addEventListener\("DOMContentLoaded", \(\) => \{\s*const INDO_QUOTES = \[.*?\];\s*const loginQuoteEl = document\.getElementById\("loginQuote"\);\s*if \(loginQuoteEl\) \{\s*loginQuoteEl\.textContent = ''"'' \+ INDO_QUOTES\[Math\.floor\(Math\.random\(\) \* INDO_QUOTES\.length\)\] \+ ''"'';\s*\}\s*\}\);\s*</script>\s*'
$text = [regex]::Replace($text, $pattern, '')

# Also remove the injected log out button at the end of login quote:
$badLogout1 = '<div class="quote" style="margin-top:16px;">> "Sehat hari ini, hebat esok hari."</div><button class="btn primary full" onclick="logout\(\)" style="margin-top: 15px; background: #e74c3c; color: white; border: none; font-weight: bold; border-radius: 12px; height: 50px;">\[ LOGOUT \]</button>'
$fixLogout1 = '<div class="quote" id="loginQuote" style="margin-top:16px; font-style: italic; font-weight: 500; color: var(--text-muted); text-align: center;"></div>'
$text = [regex]::Replace($text, $badLogout1, $fixLogout1)

# Also remove the injected log out button in the guide modal
$badLogout2 = '<div class="notice">Data ini bersifat konfidensial untuk monitoring kesehatan internal.</div><button class="btn primary full" onclick="logout\(\)" style="margin-top: 15px; background: #e74c3c; color: white; border: none; font-weight: bold; border-radius: 12px; height: 50px;">\[ LOGOUT \]</button>'
$fixLogout2 = '<div class="notice">Data ini bersifat konfidensial untuk monitoring kesehatan internal.</div>'
$text = [regex]::Replace($text, $badLogout2, $fixLogout2)

# Insert the right logout buttons at the end of student page and teacher page
$studentEnd = '</div>\s*</section>\s*<!-- ═══════════════════════════ TEACHER DASHBOARD ═══════════════════════════ -->'
$studentEndFix = '</div><button class="btn primary full" onclick="logout()" style="margin-top: 30px; background: #e74c3c; color: white; border: none; font-weight: bold; border-radius: 12px; height: 50px;">[ LOGOUT ]</button></section><!-- ═══════════════════════════ TEACHER DASHBOARD ═══════════════════════════ -->'
$text = [regex]::Replace($text, $studentEnd, $studentEndFix)

$teacherEnd = '</div>\s*</div>\s*</section>\s*<!-- ═══════════════════════════ LAPORAN NPET ═══════════════════════════ -->'
$teacherEndFix = '</div></div><button class="btn primary full" onclick="logout()" style="margin-top: 30px; background: #e74c3c; color: white; border: none; font-weight: bold; border-radius: 12px; height: 50px;">[ LOGOUT ]</button></section><!-- ═══════════════════════════ LAPORAN NPET ═══════════════════════════ -->'
$text = [regex]::Replace($text, $teacherEnd, $teacherEndFix)

Set-Content "d:\HEALTHTRACKESNESABA\index.html" $text
