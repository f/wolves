{Villager} = Wolves.Village
{translate} = Wolves.Utils

class Wolves.Village.Angel extends Villager

  @population: (players)-> switch on
    when players in [17..20] then 1

  can: (time)->
    super time, if time is 'night' then ['protect']

  protect: (someone)-> @announce 'protect', someone

  messages: (event)-> switch event
    when 'dead by wolf' then translate('{{name}}, the angel is killed by the wolf', name: @username)
    when 'dead by people' then translate('{{name}}, the angel is killed by the people', name: @username)
