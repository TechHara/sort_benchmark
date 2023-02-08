const readline = require('readline');
const fs = require('fs');

const rl = readline.createInterface({
  input: fs.createReadStream(process.argv[2]),
  output: process.stdout,
  terminal: false
});

const lines = [];

rl.on('line', line => {
  lines.push(line);
});

rl.on('close', () => {
  lines.sort();
  fs.writeFileSync(process.argv[3], lines.join('\n') + '\n');
});

