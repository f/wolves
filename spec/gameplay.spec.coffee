describe 'gameplay', ->

  Gameplay = require '../src/gameplay'

  game = null

  beforeEach -> game = new Game
  afterEach -> game = null

  it 'adds player', ->
    game.addPlayer 'player1'
    expect(game.players.length).toBe 1

    game.addPlayer 'player2'
    expect(game.players.length).toBe 2
