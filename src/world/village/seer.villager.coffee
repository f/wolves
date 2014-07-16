{Villager} = Werewolf.Village

class Werewolf.Village.Seer extends Villager

  @population: (players)-> switch on
    when players in [4..20] then 1

  can: (time)->
    super time, if time is 'night' then ['see']

  see: (someone)->
