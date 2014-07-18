require('better-require') 'json yaml'
fs                 = require 'fs'
os                 = require 'os'
yml                = require 'js-yaml'
{EventEmitter}     = require 'events'
_                  = require 'underscore'
_.templateSettings = interpolate: /\{\{(.+?)\}\}/g

# Monkey Patches
Number::plural = (singular, plural='')->
  (if @valueOf() is 1 then singular else plural).replace /%d/g, @valueOf()

# Namespacing
Werewolf = {Village: {}, Utils: {}}

Werewolf.Utils =
  duration: (duration='1s', base=0) ->

    # You can add new units here
    units = s: 1, m: 60, h: 3600

    keys = ///#{Object.keys units}///
    format = "(\\d+)([#{keys}])"

    times = duration.match ///#{format}///gi
    times.forEach (time)->
      [value, unit] = time.match(///#{format}///)[1..]
      base += units[unit] * value

    base * 1000

  wait: (time, fn, context)->
    setTimeout fn.bind(context), time

  repeat: (time, fn, context)->
    setInterval fn.bind(context), time

  cancel: (timer)->
    clearTimeout timer

  stop: (timer)->
    clearInterval timer

  translations: (file)->
    messages = require file
    (text, params={})->
      _.template messages[text]?[1] or text, params
