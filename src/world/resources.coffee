Werewolf = {Village: {}, Utils: {}}

fs             = require 'fs'
os             = require 'os'
yml            = require 'js-yaml'
{EventEmitter} = require 'events'
_              = require 'underscore'
_.templateSettings = interpolate: /\{\{(.+?)\}\}/g

yaml           = (file)-> yml.safeLoad fs.readFileSync file

config = yaml 'config/config.yml'
translations = require "../dist/i18n/#{config.locale.default}.json"

Werewolf.Utils.duration = (duration='1s', base=0) ->

  # You can add new units here
  units = s: 1, m: 60, h: 3600

  keys = ///#{Object.keys units}///
  format = "(\\d+)([#{keys}])"

  times = duration.match ///#{format}///gi
  times.forEach (time)->
    [value, unit] = time.match(///#{format}///)[1..]
    base += units[unit] * value

  base * 1000

Werewolf.Utils.wait = (time, fn, context)->
  setTimeout fn.bind(context), time

Werewolf.Utils.repeat = (time, fn, context)->
  setInterval fn.bind(context), time

Werewolf.Utils.cancel = (timer)->
  clearTimeout timer

Werewolf.Utils.stop = (timer)->
  clearInterval timer

Number::plural = (singular, plural='')->
  (if @valueOf() is 1 then singular else plural).replace /%d/g, @valueOf()

Werewolf.Utils.translate = (text, params)->
  _.template translations[text]?[1] or text, params
