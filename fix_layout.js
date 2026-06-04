const fs = require('fs');
const filepath = 'd:\\HEALTHTRACKESNESABA\\index.html';
let html = fs.readFileSync(filepath, 'utf8');

// 1. Fix the top brand logo and text
const old_brand = `<div class="brand">
        <div class="brand-logo">HT</div>
        <div>
          <h1>HEALTH TRACK ESNESABA</h1>
          <p>Program 30 Hari Hidup Sehat Bersama ? SMP NEGERI 1 BANYUBIRU</p>
        </div>
      </div>`;
const new_brand = `<div class="brand">
        <img src="logo.png" alt="Logo Sekolah" style="width: 50px; height: 50px; border-radius: 12px; object-fit: contain;">
        <div>
          <h1>HEALTH TRACK ESNESABA</h1>
          <p>Program 30 Hari Hidup Sehat Bersama<br>SMP NEGERI 1 BANYUBIRU</p>
        </div>
      </div>`;
if (html.includes(old_brand)) {
    html = html.replace(old_brand, new_brand);
} else {
    // regex fallback
    html = html.replace(/<div class="brand-logo">HT<\/div>\s*<div>\s*<h1>HEALTH TRACK ESNESABA<\/h1>\s*<p>Program 30 Hari Hidup Sehat Bersama \? SMP NEGERI 1 BANYUBIRU<\/p>\s*<\/div>/,
                  `<img src="logo.png" alt="Logo Sekolah" style="width: 50px; height: 50px; border-radius: 12px; object-fit: contain;">
        <div>
          <h1>HEALTH TRACK ESNESABA</h1>
          <p>Program 30 Hari Hidup Sehat Bersama<br>SMP NEGERI 1 BANYUBIRU</p>
        </div>`);
}

// 2. Remove the first hero-emoji loginQuote div so it doesn't show up twice
html = html.replace(/<div class="hero-emoji" id="loginQuote" [^>]+><\/div>\s*/, '');

// 3. Make sure GURU is in the classCode dropdown!
const classCodeRegex = /(<select id="classCode">[\s\S]*?<option>9F<\/option>)\s*<\/select>/;
const match = html.match(classCodeRegex);
if (match && !match[0].includes('GURU')) {
    html = html.replace(classCodeRegex, `$1\n            <option>GURU</option>\n          </select>`);
}

// 4. Fix any lingering `?` characters
html = html.replace(/\?"/g, '-"');
html = html.replace(/\? /g, '- ');

fs.writeFileSync(filepath, html, 'utf8');
console.log("Node fix script completed.");
