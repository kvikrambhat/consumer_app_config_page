const fs = require('fs');
fs.copyFileSync('tsconfig.paths.prod.json', 'tsconfig.paths.dev.json');
console.log('✅ Switched to Bit-installed components for prod build');
