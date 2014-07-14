class Villager extends Player

  can: (time, abilities=[])-> abilities.concat switch on
    when time is 'day' then ['vote', 'retract', 'goat']

  seenAs: -> 'villager'

  vote: (someone)->

  retract: (someone)->

  coin: ->

  votes: ->

  myrole: ->

  leave: ->

  goat: (someone)->
