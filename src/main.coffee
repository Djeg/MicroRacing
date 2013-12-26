jQuery ($) ->
  resizeCanvas = () ->
    canvas    = $('#canvas')
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
    canvas.css {
      display: "block"
      width: "#{nW}px"
      height: "#{nH}px"
      margin: "auto"
      border: "1px solid black"
    }

  canvas = $('#canvas')
  resizeCanvas()
  $(window).resize(resizeCanvas)
  # TODO create first scenes

