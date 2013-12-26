###*
* Defined a base actor
*
* @author David Jegat <david.jegat@gmail.com>
###
class BaseActor extends BaseCollector
  ###*
  * @constructor
  * @param {string} name
  ###
  constructor: (name, order) ->
    @order    = order
    @name     = name
    @game     = null
    @input    = null
    @graphics = null
    @scene    = null
    @mouse    = null

  ###*
  * Set up the actor
  *
  * @param {Game} game
  ###
  setUp: (game) ->
    @game     = game
    @input    = game.input
    @mouse    = game.mouse
    @scene    = game.scene
    @graphics = game.scene.graphics

  ###*
  * Handle the action
  ###
  acting: () ->
    throw "Please implement this method"
