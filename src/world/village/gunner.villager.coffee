class Werewolf.Village.Gunner extends Werewolf.Village.Villager

  @population: (players)-> switch on
    when players in [10..20] then 1

  can: (time)->
    super time, if time is 'night' then ['shoot']

  shoot: (someone)->
