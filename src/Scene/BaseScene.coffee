###*
* BaseScene class
*
* @author David Jegat <david.jegat@gmail.com>
###
class BaseScene
  ###*
  * @constructor
  ###
  constructor: () ->
    @game     = null
    @input    = null
    @mouse    = null
    @name     = @constructor.name.replace 'Scene', ''
    @graphics = new GraphicCollection
    @actors   = new ActorCollection

  ###*
  * Set up the game for the scene
  *
  * @param {Game} game
  * @throws String, if the game is not a Game
  ###
  setUpGame: (game) ->
    if not game instanceof Game
      throw "Invalid game instance"
    @game  = game
    @input = game.input
    @mouse = game.mouse

  ###*
  * Set up the graĥics
  ###
  setUpGraphics: () ->
    for name, graphic of @graphics.items
      graphic.setUp @game

  ###*
  * Set up actors
  ###
  setUpActors: () ->
    for name, actor of @actors.items
      actor.setUp @game

  ###*
  * Test if the scene is loaded
  *
  * @return {boolean}
  ###
  isLoad: () ->
    for name, graphic of @graphics.items
      if not graphic.isLoad()
        return false
    true

  ###*
  * Display a loading screne
  *
  * @throws String
  ###
  loading: () ->
    throw "Pending"

  ###*
  * Initialize graphics and actors or one scene
  *
  * @throws String
  ###
  init: () ->
    throw "Scene #{@constructor.name} init need to be defined"

  ###*
  * Initialize graphics
  ###
  initGraphics: () ->
    for name, graphic of @graphics.items
      graphic.init()

  ###*
  * Display the scene on the canvas screen
  *
  * @throws String
  ###
  display: () ->
    for actor in @actors.getOrderedItems()
      actor.acting()
