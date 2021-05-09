function rompe() {
  return 3 + z;
}

const rompeAsync = async () => {
  setTimeout(() => {
    try {
      return 3 + z;
    } catch (err) {
      console.error(err.message);
    }
  }, 1000);
};

try {
  // rompe();
  rompeAsync();
} catch (err) {
  console.error(err.message);
}
