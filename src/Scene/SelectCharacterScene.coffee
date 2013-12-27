###*
* Select the character
*
* @author David Jegat <david.jegat@gmail.com>
###
class SelectCharacterScene extends BaseScene
  ###*
  * Initialize this scene
  ###
  init: () ->

  ###*
  * Display the scene
  ###
  display: () ->
    @game.context.fillText "Pending !", @game.element.width/2, 100

