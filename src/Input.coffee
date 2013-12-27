###*
* Defined a standard way to catch keyboard input
*
* @author David Jegat <david.jegat@gmail.com>
###
class Input

  ###*
  * Return the char code of a string
  *
  * @static
  * @param {string} character
  * @return {number}
  ###
  @key: (character) ->
    if character.length > 1
      throw "Character is too long. Expecting just one character #{character.length} given"
    character.charCodeAt 0

  ###*
  * @constructor
  * @param {string} selector
  ###
  constructor: (selector) ->
    @keys     = []
    @pushKeys = []
    self = @
    $(selector)
      .keydown((event) -> self.refresh event, true)
      .keyup((event) -> self.refresh event, false)

  ###*
  * Update keys
  *
  * @param {eventObject} event
  * @param {boolean} pressing
  ###
  refresh: (event, pressing) ->
    @keys[event.keyCode]     = if pressing then on else off
    @pushKeys[event.keyCode] = if pressing then on else off

  ###*
  * Test if a key is press
  *
  * @param {number} key
  * @return boolean
  ###
  isPress: (key) ->
    if @keys[parseInt key] then true else false

  ###*
  * Test if a key is push.
  *
  * @param {number} key
  * @return boolean
  ###
  isPush: (key) ->
    if @pushKeys[parseInt key] is on
      @pushKeys[parseInt key] = off
      true
    else
      false
