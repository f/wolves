class Werewolf.Village.Drunk extends Werewolf.Village.Villager

  @appear: (players)-> switch on
    when players in [8..20] then 1
