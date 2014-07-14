class Detective extends Villager

  can: (time)->
    super time, if time is 'day' then ['id']

  appear: (players)-> switch on
    when players in [12..20] then 1

  id: (someone)->
