{Village: {Villager}} = Werewolf

class Werewolf.VillageCenter

  villagers: []

  addVillager: (villager)-> @villagers.push villager

  assignRoles: (roles=[])->
    @villagers.map (villager)->
      new Villager player

  generateRoles: ->
    
