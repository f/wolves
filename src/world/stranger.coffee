# Everyone is stranger until they are joined to the village.

class Werewolf.Stranger extends Werewolf.Human

  username: ''

  isAdmin: no
  isOwner: no
  isActive: no

  constructor: (username)->

  # Returns true/false `wolf.ableTo 'vote', at: 'night'`
  ableTo: (action, {at})-> action in @can at

  join: -> @requests 'join'
  start: -> @requests 'start'
