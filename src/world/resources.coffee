Werewolf = {Village: {}, Utils: {}}

[
  'fs'
  'os'
  'path'
  'events'
  ###

  You should use
  {fs, os} = Werewolf.Utils

  ###
].forEach (module)->
  Werewolf.Utils[module] = require module

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
