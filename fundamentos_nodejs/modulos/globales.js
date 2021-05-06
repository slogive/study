let i = 0;

const interval = setInterval(() => {
  if (i === 3) {
    clearInterval(interval);
  }

  i++;

  console.log('Hola we');
}, 1000);

setImmediate(() => {
  console.log('Hola');
});
