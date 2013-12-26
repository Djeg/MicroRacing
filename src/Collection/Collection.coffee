###*
* Represent a colelction of BaseCollector instance
*
* @author David Jegat <david.jegat@gmail.com>
###
class Collection

  ###*
  * @constructor
  ###
  constructor: () ->
    @items = {}

  ###*
  * Add an instance into this collection
  *
  * @param {BaseCollector} collector
  * @throws String, if collector is not a BaseCollector or collector always exists
  * @return Collection
  ###
  add: (collector) ->
    if not collector instanceof BaseCollector
      throw "Invalid collector"
    if undefined is not @items[collector.name]
      throw "Collector #{collector.name} always registered"
    @items[collector.name] = collector
    @

  ###*
  * Test if a collector exists
  *
  * @param {string} name
  * @return {boolean}
  ###
  has: (name) ->
    if undefined is @items[name] then false else true

  ###*
  * Retrieve a given collector
  *
  * @param {string} name
  * @throws String, if the collector at name is undefined
  * @return {BaseCollector}
  ###
  get: (name) ->
    if not @has(name)
      throw "Undefined collector #{name}"
    @items[name]
