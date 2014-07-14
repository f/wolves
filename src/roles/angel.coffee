class Angel extends Villager

  @appear: (players)-> switch on
    when players in [17..20] then 1

  can: (time)->
    super time, if time is 'night' then ['protect']

  protect: (someone)->
