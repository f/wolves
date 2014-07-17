{duration, wait, repeat, stop} = Werewolf.Utils

class Werewolf.World extends EventEmitter

  day:
    length: duration '10m'  # How long a day will be
    morning: '6am'        # People wake up
    evening: '7pm'        # People start voting
    night:   '1am'        # Wolves appear

  # world.sun 'rise'
  event: (fact, action)-> @emit 'fact', action

  sun: (event)->
    @event 'sun', event

  moment: ->
    console.log 1

  constructor: ->
    time = repeat @moment, 1000, this
    wait @day.length, => stop time
