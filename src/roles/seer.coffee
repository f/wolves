class Seer extends Villager

  @appear: (players)-> switch on
    when players in [4..20] then 1

  can: (time)->
    super time, if time is 'night' then ['see']

  see: (someone)->
