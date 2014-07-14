try {
  module.exports = require('.build/main');
} catch (e) {
  if (e.code === 'MODULE_NOT_FOUND') {
    console.error('You should run `grunt build` first to run Lykos');
  }
}
