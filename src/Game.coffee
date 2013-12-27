###*
* The MicroRacing game object
*
* @author David Jegat <david.jegat@gmail.com>
###
class Game
  ###*
  * Automatically resize canvas area to feet the screen
  *
  * @static
  * @param {string} selector, the canvas selector
  ###
  @resizeCanvas: (selector) ->
    canvas    = $(selector)
    w         = canvas.width()
    h         = canvas.height()
    ratio     = canvas.width()/canvas.height()
    maxWidth  = $(window).width() - 10
    maxHeight = $(window).height() - 20
    nW        = $(window).width() - 10
    nH        = parseInt nW/ratio
    while true
      if nH > maxHeight
        nW = nW - 1
        nH = parseInt nW/ratio
      else
        break
    css = {
      display: "block"
      width: "#{nW}px"
      height: "#{nH}px"
      margin: "auto"
    }
    if config.BORDER
      css['border'] = "1px solid black"
    else
      css['border'] = "none"
    canvas.css(css)

  ###*
  * @constructor
  * @param {string} id, the canvas id
  ###
  constructor: (id) ->
    @id       = id
    @$        = $ "##{id}"
    @element  = document.getElementById id
    if @element is null
      throw "No DOM element with id #{id}"
    @context = @element.getContext "2d"
    @isStart = false
    @loop    = null
    @FPS     = config.FPS
    @scenes  = []
    @scene   = null
    @input   = new Input "body"
    @mouse   = new Mouse "##{@id}"
    @globals = {}
    if config.AUTO_RESIZE
      Game.resizeCanvas "##{@id}"
      self = @
      $(window).resize () -> Game.resizeCanvas "##{self.id}"

  ###*
  * Add a scene into the game
  *
  * @param {BaseScene} scene
  * @throws String, if the scene is not a BaseScene
  * @return {Game}
  ###
  addScene: (scene) ->
    if not scene instanceof BaseScene
      throw "Invalid scene"
    @scenes.push scene
    @

  ###*
  * Start the game engine with a defined scene
  *
  * @param {string} sceneName
  * @throws String, is game already start or inexistant sceneName too
  ###
  start: (sceneName) ->
    if @isStart is on
      throw "Game already started"
    # try to retrieve the scene
    for scene in @scenes
      if scene.name is sceneName
        @scene = scene
        break
    if null is @scene
      throw "Invalid scene #{sceneName}"
    self   = @
    @scene = scene
    @scene.setUpGame @
    @scene.init()
    @scene.setUpGraphics()
    @scene.setUpActors()
    @scene.initGraphics()
    @loop       = window.setInterval (() -> self.draw()), 1000/@FPS
    @isStart    = on

  ###*
  * Called each fram, this method draw the scene
  ###
  draw: () ->
    @context.clearRect 0, 0, @element.width, @element.height
    if @scene.isLoad()
      @scene.display()
    else
      @scene.loading()

  ###*
  * Stop a scene
  *
  * @throws String, if the game is not started
  ###
  stop: (sceneName) ->
    if not @isStart
      throw "Unable to stop a game not started :("
    @context.clearRect 0, 0, @element.width, @element.height
    @isStart = off
    @scene = null
    window.clearInterval(@loop)

  ###*
  * Set up a global game variable
  *
  * @param {string} key
  * @param {*} value
  * @return {Game}
  ###
  set: (key, value) ->
    @globals[key] = value
    @

  ###*
  * Retrieve a global game variable
  *
  * @param {string} key
  * @throws {String}, if the global at key does not exists
  * @return {*}
  ###
  get: (key) ->
    if undefined is @globals[key]
      throw "Undefined global game variable ##{key}"
    @globals[key]

  ###*
  * Test is a global variable exists
  *
  * @param {string} key
  * @return {boolean}
  ###
  has: (key) ->
    if undefined is @globals[key] then false else true
