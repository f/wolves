# Everyone is stranger until they are joined to the village.

class Werewolf.Village.Stranger

  isAdmin: no
  isOwner: no
  isActive: no

  # Returns true/false `wolf.ableTo 'vote', on: 'night'`
  ableTo: (action, {on})-> action in @can on

  constructor: (@details)->
