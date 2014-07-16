{Villager} = Werewolf.Village

class Werewolf.Village.Drunk extends Villager

  @population: (players)-> switch on
    when players in [8..20] then 1
