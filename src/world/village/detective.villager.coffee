{Villager} = Wolves.Village

class Wolves.Village.Detective extends Villager

  @population: (players)-> switch on
    when players in [12..20] then 1

  can: (time)->
    super time, if time is 'day' then ['id']

  id: (someone)-> @announce 'id', someone
