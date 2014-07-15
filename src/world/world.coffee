{events: {EventEmitter}, , wait, repeat, stop} = Werewolf.Utils

class Werewolf.World extends EventEmitter

  day:
    length: duration '10m'  # How long a day will be
    morning: '06:00'        # People wake up
    evening: '19:00'        # People start voting
    night:   '01:00'        # Wolves appear

  # world.sun 'rise'
  event: (fact, action)-> @emit 'fact', action

  sun: (event)->
    @event 'sun', event

  moment: ->
    console.log 1

  constructor: ->
    time = repeat @moment, 1000, this
    wait @day.length, => stop time
