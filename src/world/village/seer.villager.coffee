class Werewolf.Village.Seer extends Werewolf.Village.Villager

  @population: (players)-> switch on
    when players in [4..20] then 1

  can: (time)->
    super time, if time is 'night' then ['see']

  see: (someone)->
