class Werewolf.Village.Villager extends Werewolf.Village.Stranger

  can: (time, abilities=[])-> abilities.concat switch on
    when time is 'day' then ['vote', 'retract', 'goat']

  seenAs: -> 'villager'

  coin: -> if Math.random() > 0.5 then 'heads' else 'tails'

  goat: (someone)->     @announce 'goat', someone
  vote: (someone)->     @announce 'vote', someone
  retract: (someone)->  @announce 'retract', someone
  votes: ->             @announce 'votes'
  myrole: ->            @announce 'myrole'
  leave: ->             @announce 'leave'
