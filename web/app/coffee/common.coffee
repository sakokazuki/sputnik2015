#common.coffee

#ellipse
CanvasRenderingContext2D::ellipse = (_x, _y, _width, _height) ->
  x = if _x then _x else 0
  y = if _y then _y else 0
  width = if _width then _width else 0
  height = if _height then _height else 0
  radW = width / 2
  radH = height / 2
  @beginPath()
  @bezierCurveTo x, y - radH, x + radW, y - radH, x + radW, y
  @bezierCurveTo x + radW, y, x + radW, y + radH, x, y + radH
  @bezierCurveTo x, y + radH, x - radW, y + radH, x - radW, y
  @bezierCurveTo x - radW, y, x - radW, y - radH, x, y - radH
  @closePath()
  return

#requestAnimationFrame
do ->
  requestAnimationFrame = window.requestAnimationFrame or window.mozRequestAnimationFrame or window.webkitRequestAnimationFrame or window.msRequestAnimationFrame
  window.requestAnimationFrame = requestAnimationFrame
  return
do ->
  cancelAnimationFrame = window.cancelAnimationFrame or window.mozcancelAnimationFrame or window.webkitcancelAnimationFrame or window.mscancelAnimationFrame
  window.cancelAnimationFrame = cancelAnimationFrame
  return