{time, duration, wait, repeat, stop} = utils

class Wolves.World extends EventEmitter

  day:
    length: duration '10s'  # How long a day will be
    breaks:
      morning: time '6am'        # People wake up
      evening: time '7pm'        # People start voting
      night:   time '1am'        # Wolves appear

  # world.sun 'rise'
  event: (fact, action)-> @emit 'fact', action

  setCurrentTime: (hours, mins)->
    @currentTime.setHours hours
    @currentTime.setMinutes mins

  minute: ->
    for own timeName, timeBreak of @day.breaks
      breakTime = @generateTime timeBreak...
      hours = breakTime.getHours()
      mins = breakTime.getMinutes()
      day = @currentTime.getDay()+1

      if hours is @currentTime.getHours()\
      and mins is @currentTime.getMinutes()
        @emit timeName, hours, mins, day

    # Pass a minute
    @currentTime.setTime @currentTime.getTime() + 60*1000

  generateTime: (hours, mins)-> new Date 1970, 1, 1, hours, mins, 0

  constructor: ->

    @on 'start', =>
      if @started
        console.log "World is already started"
        return

      [hours, mins] = @day.breaks.night
      @currentTime = @generateTime hours, mins

      elapse = (@day.length * 1000) / (24*60*1000)
      time = repeat elapse, @minute, this

      @started = yes

    @on 'finish', =>
      unless @started
        console.log "There is no world, start first"
        return

      stop time
      @started = no

  start: -> @emit 'start'
  end: -> @emit 'finish'
