try {
  require('.build/index');
} catch (e) {
  if (e.code === 'MODULE_NOT_FOUND') {
    console.log('You should run `grunt build` first to run Lykos');
  }
}

