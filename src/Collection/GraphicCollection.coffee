###*
* Represent a collection of graphic object
*
* @author David Jegat <david.jegat@gmail.com>
###
class GraphicCollection extends Collection
  ###*
  * REdefined the add to handle Graphic object only support
  *
  * @param {BaseGraphic} graphic
  * @throws String, if the graphic is not a BaseGraphic
  * @return {GraphicCollection}
  ###
  add: (graphic) ->
    if not graphic instanceof BaseGraphic
      throw "Invalid graphic"
    super graphic
    @
