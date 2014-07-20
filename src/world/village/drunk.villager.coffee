{Villager} = Wolves.Village

class Wolves.Village.Drunk extends Villager

  @population: (players)-> switch on
    when players in [8..20] then 1
