
module.exports = (action='default', args)->

  # Initialize translations
  CONFIG.locale.default = args.locale if args.locale
  translate = utils.translations CONFIG.locale.default

  [action, subaction] = args._
  console.log translate 'Killed by {count, plural, one{a wolf} other{wolves}}', count: 1

  players = []

  world = new @World()
  bot = new Wolves.Bot()
  bot.listenCommands()
  bot.on 'self:join', (r) ->
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
