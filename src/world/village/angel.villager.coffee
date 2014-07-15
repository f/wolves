class Werewolf.Village.Angel extends Werewolf.Village.Villager

  @population: (players)-> switch on
    when players in [17..20] then 1

  can: (time)->
    super time, if time is 'night' then ['protect']

  protect: (someone)-> @announce 'protect', someone

  messages: (event)-> switch event
    when 'dead by wolf' then @_ '{name}, the angel is killed by a wolf'
    when 'dead by people' then @_ '{name}, the angel is killed by the people'
