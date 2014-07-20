Wolves = require '../lykos'

describe 'Gameplay basic algorithms', ->

  game = null

  beforeEach -> game = new Wolves.VillageSquare

  it 'adds players to the game', ->
    game.addVillager 'player1'
    expect(game.villagers.length).toBe 1

    game.addVillager 'player2'
    expect(game.villagers.length).toBe 2

  it 'adds random roles to the players', ->
    game.addVillager 'player1'
    game.addVillager 'player2'
    game.addVillager 'player3'
    game.addVillager 'player4'
