{Client} = require 'irc'

module.exports = (action='default', args)->
  config = require '../config/irc.yml'
  console.log config

  client = new Client 'irc.freenode.net', 'ayazagamuhtari',
    channels: ['#ayazaga-dev']
  client.addListener 'message', (sender, channel, message, {user})->
    console.log arguments
  client.addListener 'connect', ->
    client.send('MODE', '#ayazaga-dev', '+o', 'ayazagamuhtari');
