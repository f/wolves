{duration, wait, repeat, stop} = Wolves.Utils

class Wolves.World extends EventEmitter

  day:
    length: duration '10m'  # How long a day will be
    morning: time '6am'        # People wake up
    evening: time '7pm'        # People start voting
    night:   time '1am'        # Wolves appear

  # world.sun 'rise'
  event: (fact, action)-> @emit 'fact', action

  sun: (event)->
    @event 'sun', event

  day: -> @sun 'rise'
  night: -> @sun 'set'

  minute: ->
    # Pass a minute
    @currentTime.setTime @currentTime.getTime() + 60*1000

  constructor: ->
    [hours, mins] = @day.night
    @currentTime = new Date 0, 0, 0, hours, mins, 0

    time = repeat @minute, 1000, this
    wait @day.length, => stop time
