const hablar = (username) =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log(`Iniciando el proceso`);

      resolve(username);
    }, 1000);
  });

const hola = (username) =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log(`Hola ${username}`);

      resolve(username);
    }, 1000);
  });

const conversar = (username) =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log(`Bla bla bla bla`);

      reject('username not defined');
    }, 1000);
  });

const adios = (username) =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log(`Adios ${username}`);

      resolve(username);
    }, 1000);
  });

// Ejecucion

hablar('Cesar')
  .then(hola)
  .then(conversar)
  .then(conversar)
  .then(conversar)
  .then(conversar)
  .then(adios)
  .then(() => {
    console.log('Terminado el proceso');
  })
  .catch((error) => console.log(error));
