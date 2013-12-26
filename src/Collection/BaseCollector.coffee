###*
* Represent an object that can be in a collection
*
* @author David Jegat <david.jegat@gmail.com>
###
class BaseCollector

  ###*
  * @consructor
  * @param {string} name = null
  ###
  constructor: (name) ->
    if name
      @name = name
    else
      @name = @constructor.name

