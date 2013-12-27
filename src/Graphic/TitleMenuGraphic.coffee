###*
* Menu for the title scene
###
class TitleMenuGraphic extends BaseGraphic
  ###*
  * Initialize the title menu graphic
  ###
  init: () ->
    @w = 250
    @x = parseInt (@game.element.width / 2) - (@w/2)
    @y = parseInt @game.element.height - 150
    @background = new Image
    @background.src = 'images/test_bg.png'

  ###*
  * Ensure that the image is ready
  *
  * @return {boolean}
  ###
  isLoad: () ->
    @background.complete

  ###*
  * Display this graphic
  *
  * @param {number} menuIndex
  * @param {Array} menus
  * @throws String, if the menu is not a valid array or the menuIndex is uncorect
  ###
  draw: (menuIndex, menus) ->
    menuIndex = parseInt menuIndex
    if not menus instanceof Array
      throw "Invalid menu on #{@name} scene"
    if menuIndex < 0 or menuIndex > menus.length - 1
      throw "Invalid menu index #{menuIndex} on scene #{@name}"
    @game.context.drawImage @background, 0, 0
    @drawSelector(menuIndex)
    @drawMenu(menuIndex, menus)

  ###*
  * Display menu selector
  *
  * @param {number} menuIndex
  ###
  drawSelector: (menuIndex) ->
    y = @y + (menuIndex*30)
    @game.context.fillStyle = "rgba(0, 0, 0, 0.8)"
    @game.context.fillRect @x, y, @w, 25

  ###*
  * Draw the menu
  *
  * @param {number} menuIndex
  * @param {Array} menus
  ###
  drawMenu: (menuIndex, menus) ->
    @game.context.font = "18px Arial bold"
    for i, menu of menus
      y = (@y+17) + (i*30)
      if parseInt(i) == menuIndex
        @game.context.fillStyle = "rgb(255, 255, 255)"
      else
        @game.context.fillStyle = "rgb(0, 0, 0)"
      @game.context.fillText menu, @x, y
