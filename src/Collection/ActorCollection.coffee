###*
* Collect actors
*
* @author David Jegat <david.jegat@gmail.com>
###
class ActorCollection extends Collection
  ###*
  * Redefined the add method to handle BaseActor object
  *
  * @param {BaseActor} actor
  * @throws String
  * @return {ActorCollection}
  ###
  add: (actor) ->
    if not actor instanceof BaseActor
      throw "Invalid actor"
    super actor
    @

  ###*
  * Get ordered items
  *
  * @throws String, if two order is the same
  * @return {Array}
  ###
  getOrderedItems: () ->
    ordered = []
    for name, actor of @items
      if ordered[actor.order] instanceof BaseActor
        throw "The actor #{actor.name} has same order than #{ordered[actor.order].name}"
      ordered[actor.order] = actor
    ordered
