class Werewolf.Village.Wolf extends Werewolf.Village.Villager

  @appear: (players)-> switch on
    when players in [4..10] then 1
    when players in [11..13] then 2
    when players in [14..19] then 3
    when players is 20 then 4

  can: (time)->
    super time, if time is 'night' then ['kill']

  seenAs: -> 'wolf'

  kill: (someone)->
