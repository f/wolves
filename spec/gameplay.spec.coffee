Gameplay = require '../src/gameplay'

describe 'Gameplay basic algorithms', ->

  game = null

  beforeEach -> game = new Gameplay
  afterEach -> game = null

  it 'adds players to the game', ->
    game.addPlayer 'player1'
    expect(game.players.length).toBe 1

    game.addPlayer 'player2'
    expect(game.players.length).toBe 2

  it 'adds random roles to the players', ->
    game.addPlayer 'player1'
    game.addPlayer 'player2'
    game.addPlayer 'player3'
    game.addPlayer 'player4'
