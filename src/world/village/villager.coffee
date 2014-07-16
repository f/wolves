{Stranger} = Werewolf

class Werewolf.Village.Villager extends Stranger

  can: (time, abilities=[])-> abilities.concat switch on
    when time is 'day' then ['vote', 'retract', 'goat']

  seenAs: -> 'villager'

  coin: -> if Math.random() > 0.5 then 'heads' else 'tails'

  ###
  someone.requests 'goat', to: someone
  someone.goats someone
  someone.asks 'roles'
  someone.reported
  someone.
  ###
  goats: (someone)->     @requests 'goat', to: someone
  votes: (someone)->     @requests 'vote', to: someone
  retracts: (someone)->  @requests 'retract', from: someone
  reports: ->            @requests 'votes'
  role: ->               @requests 'role'
  leaves: ->             @requests 'leave'
