class Werewolf.Village.Drunk extends Werewolf.Village.Villager

  @population: (players)-> switch on
    when players in [8..20] then 1
