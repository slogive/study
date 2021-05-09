const { exec, spawn } = require('child_process');

// exec('dir', (err, stdout, stderr) => {
//   if (err) {
//     console.error(err);
//     return false;
//   }

//   console.log(stdout);
// });

const proceso = spawn('cmd.exe', ['/c', 'dir']);

console.log(proceso.pid);
console.log(proceso.connected);

proceso.stdout.on('data', (dato) => {
  console.log(process.killed);
  console.log(dato.toString());
});

proceso.on('exit', () => {
  console.log(proceso.killed);
  console.log('Termino el proceso.');
});
