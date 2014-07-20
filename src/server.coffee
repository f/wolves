

module.exports = (action='default', args)->
  [action, subaction] = args._
  console.log translate 'Killed by {count, plural, one{a wolf} other{wolves}}', count: 1
