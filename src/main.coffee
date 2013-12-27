jQuery ($) ->
  canvas = $('#canvas')
  # TODO create first scenes
  scenes = [
    new TitleScene
    new SelectCharacterScene
    new OptionsScene
  ]
  game = new Game "canvas"
  for scene in scenes
    game.addScene scene
  game.start scenes[0].name

