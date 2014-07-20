class Server

  constructor: (@Wolves, args)->
    console.log "#{sty.red sty.bold 'Wolves'}: #{sty.yellow 'IRC Based Werewolf Game'}"
    CONFIG.IRC.connection.debug = args.debug or args.d

  run: (action, subaction, args)->
    if @[action]?
      console.log "=> #{sty.blue action}"
      @[action] subaction, args

  start: ->
    players = []

    world = new @Wolves.World()
    bot = new Wolves.Bot()
    bot.listenCommands()

    bot.on 'self:join', (r) ->
      console.log "Joined #{sty.bold r.channel} with name #{sty.bold r.nick}"
      bot.chanserv "OP #{r.channel} #{r.nick}"
      bot.say color.bold.rainbow("Wolves Bot Initialized"), r.channel

    bot.on 'command:join', (message)->
      players.push message.nick
      if players.length is 1
        message.reply translate """
        {name} yeni bir oyun isteği gönderdi. Oyuncuları davet etmek için "!ping" komutunu kullanın
        """, name: message.nick
      else
        message.reply translate """
        {name} oyuna katıldı. Şu an oyunda {count} kişi var.
        """, name: message.nick, count: players.length

    bot.connect()
    # world.start()


module.exports = (action='default', args)->

  # Initialize translations
  CONFIG.locale.default = args.locale if args.locale
  translate = utils.translations CONFIG.locale.default

  [action, subaction] = args._
  server = new Server this, args
  server.run action, subaction, args
