###*
* Represent a standard graphic
*
* @author David Jegat <david.jegat@gmail.com>
###
class BaseGraphic extends BaseCollector
  ###*
  * @consructor
  * @param {string} name
  ###
  constructor: () ->
    @name = @constructor.name.replace('Graphic', '')
    @game = null

  ###*
  * Set up the game
  *
  * @param {Game} game
  * @throws String, is game is not a Game
  ###
  setUp: (game) ->
    if not game instanceof Game
      throw "Invalid game"
    @game = game

  ###*
  * Test is the graphic is loaded
  *
  * @return {boolean}
  ###
  isLoad: () ->
    true

  ###*
  * Initialize graphics
  ###
  init: () ->

  ###*
  * Draw the graphic
  *
  * @throws String
  ###
  draw: () ->
    throw "Please implement this method"
