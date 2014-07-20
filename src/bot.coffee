irc         = require 'irc'
sty         = require 'sty'
color       = require 'irc-colors'

class Wolves.Bot extends EventEmitter

  settings: CONFIG.IRC

  constructor: ->

    @prepClient()
    @prepEvents()
    @loadExtensions?()

    @emit 'self:start',
      client: @client

  toString: () ->
    "Wolves node/#{process.versions.node}"

  connect: ->
    @client.connect()
    return

  prepClient: ->
    @client = new irc.Client @settings.connection.host, @settings.auth.username,
      userName: @settings.auth.username
      realName: @settings.auth.realname
      password: "#{@settings.auth.password}"
      port:     @settings.connection.port
      channels: [@settings.channel]
      autoConnect: false
      autoRejoin: true
      debug: @settings.connection.debug

  prepEvents: ->
    @client.on 'error', (err) ->
      @emit 'client:error', err

    @client.on 'registered', (msg) =>
      @send 'NICK', @settings.nickname
      @emit 'self:connected',
        server: msg.server

    @client.on 'message', (from, to, message) =>
      if to isnt @settings.nick
        @emit 'user:talk',
          nick: from
          channel: to
          text: message
          client: @client
          reply: (txt) => @say txt, to

    @client.on 'pm', (from, text, message) =>
      @emit 'user:private',
        nick: from
        text: text
        client: @client
        reply: (txt) => @say txt, from

    @client.on 'join', (channel, nick, message) =>
      if nick is @settings.nickname
        @emit 'self:join',
          channel: channel
          nick: nick
          text: message
          client: @client
      else
        @emit 'user:join',
          channel: channel
          nick: nick
          text: message
          client: @client
          reply: (txt) => @say txt, channel

  debug: (n,d) ->
    if @settings.botDebug
      console.log "[#{sty.bold 'debug'}](#{sty.red sty.bold n}) #{sty.bold d}"

  emit: (e, params...) ->
    super e, params...
    if e isnt '*'
      @emit '*', e, params...

  on: (e, callback) ->
    if typeof e is 'string'
      super e, callback       # Is native syntax
    else if e.event? and e.trigger?
      @on e.event, e.trigger  # Is object literal syntax
    else
      @on o for o in e        # Is array of objects literal

  ###
  IRC basic interface
  ###

  say: (text, channel) ->
    if channel?
      @client.say channel, text
      @emit 'self:talk',
          channel: channel
          text: text
          client: @client
    else
      for channel in @channels
        @emit 'self:talk',
          channel: channel
          text: text
          client: @client
        @client.say channel, text

  leave: (channel, callback) ->
    if channels in @channels
      @client.part channel, callback
      @channels.pop channel

  join: (channel, callback) ->
    @client.join channel, callback
    @chanels.push channel

  send: ->
    @client.send arguments...

  chanserv: (data)->
    @say data, 'chanserv'

###
Built-in extensions
###

Wolves.Bot::hear = (regex, callback) ->
  @on 'user:talk', (r) ->
    if r.text.match regex
      callback(r)

Wolves.Bot::listenCommands = (commander=@settings.commander)->
  command = ///^#{commander}(\w+)///
  @hear command, (message)=>
    [_, cmd] = message.text.match command
    @emit "command:#{cmd}", message

Wolves.Bot::loadExtensions = ->
  if @settings.botDebug
    @on '*', (e,r) ->
      @debug e r
  @on 'self:start', ->
    version = @toString()
    console.log "[#{sty.bold sty.green version}] IRC Client #{sty.bold sty.cyan 'loaded'}, ready to connect."
  @on 'self:connected', (r) ->
    console.log "Connected to the server #{sty.green sty.bold r.server}"
  @on 'self:join', (r) ->
    console.log "Joined #{sty.yellow r.channel}"
  @on 'self:talk', (r) ->
    console.log "[#{sty.bold sty.red r.channel}] #{sty.green r.text}"
  @on 'user:private', (r) ->
    console.log "[#{sty.bold sty.red 'private'}] #{sty.green r.nick}: #{r.text}"
