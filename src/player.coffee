class Player

  # Returns true/false `wolf.ableTo 'vote', on: 'night'`
  ableTo: (action, {on})-> action in @can on
