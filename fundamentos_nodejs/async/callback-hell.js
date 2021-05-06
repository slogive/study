const username = 'Cesar';

function hola(username, miCallback) {
  setTimeout(() => {
    console.log(`Hola ${username}`);

    miCallback(username);
  }, 1000);
}

function hablar(username, callback) {
  setTimeout(() => {
    console.log('Bla bla bla bla');

    callback(username);
  }, 1000);
}

function adios(username) {
  setTimeout(() => {
    console.log(`Adios ${username}`);
  }, 1000);
}

// Not Callback Hell

hola(username, (username) => {
  charla(username, 0, () => {
    console.log(`Adios ${username}`);
  });
});

function charla(username, veces, callback) {
  if (veces >= 0) {
    hablar(username, () => {
      charla(username, --veces, callback);
    });
  } else {
    adios(username, callback);
  }
}
