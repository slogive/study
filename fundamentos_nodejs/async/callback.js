function hola(username, miCallback) {
  setTimeout(() => {
    console.log(`Hola ${username}`);

    miCallback();
  }, 1000);
}

function adios(username) {
  setTimeout(() => {
    console.log(`Adios ${username}`);
  }, 1000);
}

const username = 'Cesar';

hola(username, () => adios(username));

// Sin async
// hola(username, () => {});
// adios(username, () => {});
