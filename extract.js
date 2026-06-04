const fs = require('fs');
const html = fs.readFileSync('d:\\HEALTHTRACKESNESABA\\index.html', 'utf8');
const match = html.match(/<script>([\s\S]*?)<\/script>/);
if (match) {
    fs.writeFileSync('temp_check.js', match[1]);
    console.log("Extracted JS");
} else {
    console.log("No script tag found");
}
