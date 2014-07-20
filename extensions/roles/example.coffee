## You can create additional characters for the game

class Wolves.Village.ExampleRole extends Villager

  # What and when can they do ...
  can: (time)->
    super time, if time is 'night' then ['doSomething']

  # The action
  doSomething: (params)->
