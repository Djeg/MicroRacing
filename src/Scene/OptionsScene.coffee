###*
* This scene allow player to defined options
*
* @author David Jegat <david.jegat@gmail.com>
###
class OptionsScene extends BaseScene
  ###*
  * Initialize this scene
  ###
  init: () ->

  ###*
  * Display the scene
  ###
  display: () ->
    @game.context.fillStyle = "rgb(0, 0, 0)"
    @game.context.fillText "Pending !", @game.element.width/2, 100
