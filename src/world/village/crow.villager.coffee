{Villager} = Wolves.Village

class Wolves.Village.Crow extends Villager

  @population: (players)-> switch on
    when players in [12..20] then 1

  can: (time)->
    super time, if time is 'night' then ['kill', 'observe']

  kill: (someone)-> @announce 'kill', someone
  observe: (someone)-> @announce 'observe', someone
