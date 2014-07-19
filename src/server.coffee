
module.exports = (action='default', args)->
  [action, subaction] = args._
  console.log """
  #{action}
  """
