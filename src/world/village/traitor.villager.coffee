{Seer, Detective, Villager} = Wolves.Village

class Wolves.Village.Traitor extends Villager

  @population: (players)-> switch on
    when players in [8..20] then 1

  seenAs: (inspector)-> switch on
    when inspector instanceof Seer then 'villager'
    when inspector instanceof Detective then 'traitor'
