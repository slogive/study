const fs = require('fs').promises;
const fswa = require('fs');

function leer(ruta, cb) {
  fswa.readFile(ruta, (err, data) => {
    cb(data.toString());
  });
}

function escribir(ruta, contenido, cb) {
  fs.writeFile(ruta, contenido, () => {
    if (err) {
      console.error('No pudo ser escrito: ' + err);
    } else {
      console.log('Escritura completada.');
    }
  });
}

function borrar(ruta, cb) {
  fs.unlink(ruta, cb);
}

const fileLocation = `${__dirname}/text.txt`;

leer(fileLocation, console.log);
escribir(fileLocation, 'Soy un archivo nuevo', console.log);
borrar(fileLocation, console.log);

// const readFile = async () => {
//   const file = await fs.readFile('./modulos/text.txt', { encoding: 'utf-8' });
//   console.log(file);
// };

// readFile();
