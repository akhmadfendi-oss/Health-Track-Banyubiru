import re
import sys
html = open(r'd:\HEALTHTRACKESNESABA\index.html', encoding='utf-8').read()
m = re.search(r'<script>(.*?)</script>', html, re.DOTALL)
if m:
    open('temp_check.js', 'w', encoding='utf-8').write(m.group(1))
    print("Extracted JS to temp_check.js")
else:
    print("Could not extract JS")
