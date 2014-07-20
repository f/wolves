{Villager} = Wolves.Village
{translate} = utils

class Wolves.Village.Angel extends Villager

  @population: (players)-> switch on
    when players in [17..20] then 1

  can: (time)->
    super time, if time is 'night' then ['protect']

  protect: (someone)-> @announce 'protect', someone

  messages: (event)-> switch event
    when 'dead by wolf' then translate('Killed by {count, plural, one{wolf} other{wolves}}', name: @username, count: 2)
    when 'dead by people' then translate('{name}, the angel is killed by the people', name: @username)
