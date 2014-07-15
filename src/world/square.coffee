{Village: {Villager}} = Werewolf

class Werewolf.Square

  villagers: []

  addVillager: (villager)-> @villagers.push villager

  createVillagers: (roles=[])->
    @villagers.map (villager)->
      new Villager player

  generateVillagers: ->
    console.log Village

module.exports = Werewolf
