###*
* Handle a mouse or a tactile screen
*
* @author David Jegat <david.jegat@gmail.com>
###
class Mouse

  ###*
  * @param {string} selector, the selector where you want to attach the Mouse
  * @constructor
  ###
  constructor: (selector) ->
    @$       = $ selector
    @x       = 0
    @y       = 0
    @in      = off
    @buttons = []
    self = @
    @$.mousedown (event) -> self.handleClick(event, true)
    @$.mouseup (event) -> self.handleClick(event, false)
    @$.mouseenter (event) -> self.refreshMouseState(event, true)
    @$.mouseleave (event) -> self.refreshMouseState(event, false)
    @$.mousemove (event) -> self.handleMovement(event)

  ###*
  * Handle a mouse click
  *
  * @param {eventObject} event
  * @param {boolean} pressing
  ###
  handleClick: (event, pressing) ->
    @buttons[event.which] = if pressing then true else false

  ###*
  * Refresh the mouse state
  *
  * @param {eventObject} event
  * @param {boolean} entering
  ###
  refreshMouseState: (event, entering) ->
     @in = if entering then true else false

  ###*
  * Handle movement
  *
  * @param {eventObject} event
  ###
  handleMovement: (event) ->
    @x = (event.pageX - @$.offset().left)
    @y = (event.pageY - @$.offset().top)

  ###*
  * Test is the mouse is clicking
  *
  * @param {number} button
  * @return boolean
  ###
  isPress: (button) ->
    if @buttons[button] then true else false
