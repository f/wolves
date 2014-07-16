{Villager} = Werewolf.Village

class Werewolf.Village.Gunner extends Villager

  @population: (players)-> switch on
    when players in [10..20] then 1

  can: (time)->
    super time, if time is 'night' then ['shoot']

  shoot: (someone)->
