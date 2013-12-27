###*
* Title scene
*
* @author David Jegat <david.jegat@gmail.com>
###
class TitleScene extends BaseScene
  ###*
  * INitialize the scene
  ###
  init: () ->
    @loadLoop = 0
    @loader   = "."
    @index    = 0
    @menus    = [
      '1 player'
      '2 player'
      '3 player'
      '4 player'
      'Options'
    ]
    @scenes   = [
      'SelectCharacter'
      'SelectCharacter'
      'SelectCharacter'
      'SelectCharacter'
      'Options'
    ]
    @graphics.add new TitleMenuGraphic

  ###*
  * draw the scene
  ###
  display: () ->
    if @input.isPush keys.DOWN
      @index = if @index + 1 > @menus.length - 1 then 0 else @index + 1
    if @input.isPush keys.UP
      @index = if @index - 1 < 0 then @menus.length - 1 else @index - 1
    @graphics.get('TitleMenu').draw(@index, @menus)
    if @input.isPush keys.ENTER
      @game.stop()
      @game.set('number_players', @index+1)
      @game.start(@scenes[@index])

  ###*
  * Draw the scene during graphics loading
  ###
  loading: () ->
    @game.context.font = "20px Arial bold"
    @game.context.fillStyle = "rgb(0, 0, 0)"
    metrics = @game.context.measureText("Loading#{@loader}")
    x = (@game.element.width/2) - (metrics.width/2)
    y = (@game.element.height/2) - 10
    @game.context.fillText "Loading#{@loader}", x, y
    if @loadLoop >= 10
      if @loader.length < 3
        @loader = ".#{@loader}"
      else
        @loader = "."
      @loadLoop = 0
    else
      @loadLoop += 1
