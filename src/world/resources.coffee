{translations}     = Werewolf.Utils

config    = require '../config/config.yml'
translate = translations "../dist/i18n/#{config.locale.default}.json"
