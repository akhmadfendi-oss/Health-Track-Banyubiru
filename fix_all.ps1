$text = Get-Content "d:\HEALTHTRACKESNESABA\index.html" -Raw

# ============================================================
# 1. GANTI TAB "Siswa" -> "User" dan "Guru" -> "Admin"
# ============================================================
$text = $text.Replace(
    "<button id=""studentTab"" class=""active"" onclick=""setRole('student')"">Siswa</button>",
    "<button id=""studentTab"" class=""active"" onclick=""setRole('student')"">User</button>"
)
$text = $text.Replace(
    "<button id=""teacherTab"" onclick=""setRole('teacher')"">Guru</button>",
    "<button id=""teacherTab"" onclick=""setRole('teacher')"">Admin</button>"
)

# GANTI tombol "LOGIN AS STUDENT" -> "LOGIN AS USER"
$text = $text.Replace(
    "onclick=""studentLogin()"">LOGIN AS STUDENT</button>",
    "onclick=""studentLogin()"">LOGIN AS USER</button>"
)

# GANTI tombol "LOGIN AS ADMIN" (sudah benar, pastikan tetap)
# Tombol ini sudah "LOGIN AS ADMIN" jadi tidak perlu diubah

# ============================================================
# 2. TAMBAHKAN "GURU" di dropdown Kelas (di baris setelah 9F)
# ============================================================
# Dropdown kelas siswa (id="classCode") 
$text = $text.Replace(
    "<option>9A</option><option>9B</option><option>9C</option><option>9D</option><option>9E</option><option>9F</option>`n          </select>",
    "<option>9A</option><option>9B</option><option>9C</option><option>9D</option><option>9E</option><option>9F</option>`n            <option>GURU</option>`n          </select>"
)

# Jika format berbeda, coba cara lain
$oldDropdown1 = '<option>9A</option><option>9B</option><option>9C</option><option>9D</option><option>9E</option><option>9F</option>
          </select>'
$newDropdown1 = '<option>9A</option><option>9B</option><option>9C</option><option>9D</option><option>9E</option><option>9F</option>
            <option>GURU</option>
          </select>'

if ($text.Contains('<option>9F</option>') -and -not $text.Contains('<option>GURU</option>')) {
    # Tambah GURU setelah 9F pada dropdown pertama (classCode)
    $text = $text.Replace(
        '<option>9F</option>
          </select>',
        '<option>9F</option>
            <option>GURU</option>
          </select>'
    )
}

# ============================================================
# 3. KODE ADMIN sudah ESNESABA123OKE - verifikasi
# ============================================================
# Sudah benar: const TEACHER_CODE = "ESNESABA123OKE";

# ============================================================
# 4. PASTIKAN ANIMASI NUTRIFOOD RAIN LEBIH LEBAT (100 logo)
# ============================================================
# Ubah jumlah logo dari 70 menjadi 100 untuk efek hujan lebat
$text = $text.Replace(
    'for (let i = 0; i < 70; i++)',
    'for (let i = 0; i < 100; i++)'
)

# Percepat durasi jatuh agar terlihat lebih deras
$text = $text.Replace(
    'img.style.animationDuration = (Math.random() * 4 + 3) + "s"; // 3s to 7s (faster fall)',
    'img.style.animationDuration = (Math.random() * 3 + 2) + "s"; // 2s to 5s (heavy rain)'
)

# Perbesar rentang ukuran logo
$text = $text.Replace(
    'img.style.width = (Math.random() * 70 + 50) + "px"; // 50px to 120px for depth',
    'img.style.width = (Math.random() * 60 + 40) + "px"; // 40px to 100px for heavy rain'
)

Set-Content "d:\HEALTHTRACKESNESABA\index.html" $text -Encoding UTF8
Write-Host "ALL FIXES APPLIED SUCCESSFULLY"
