{Seer, Detective, Villager} = Wolves.Village

class Wolves.Village.Cursed extends Villager

  @population: (players)-> switch on
    when players in [4..17] then 1
    when players in [18..20] then 2

  seenAs: (inspector)-> switch on
    when inspector instanceof Seer then 'wolf'
    when inspector instanceof Detective then 'cursed'
    else super
