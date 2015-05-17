#planet.coffee
common = require "./common.coffee"

class Planet
  constructor: (arg)->
    cnt = arg or 0
    id = if cnt.id then cnt.id else 0
    width = if cnt.width then cnt.width else 0
    height = if cnt.height then cnt.height else 0
    speed = if cnt.speed then cnt.speed else 0
    color = if cnt.color then cnt.color else 0

    @canvas = document.getElementById id
    @canvas.width = width
    @canvas.height = height
    @ctx = @canvas.getContext "2d"
    @w = width
    @h = height
    @angle = 0.0
    @speed = speed
    @color = color

  animate: ()=>
    requestAnimationFrame @animate
    g = @ctx

    g.clearRect 0, 0, @w, @h

    g.fillStyle = @color
    g.ellipse @w/2, @h/2, 52, 52
    g.fill()


    g.translate @w/2, @h/2 #------------------push

    g.rotate -Math.PI / 6

    g.strokeStyle = @color
    g.beginPath()
    g.ellipse 0, 0, 124, 18
    g.stroke()

    g.rotate Math.PI / 6
    g.translate -@w/2, -@h/2 #------------------pop

    @angle += @speed
    rw = 62.0
    rh = 9.0
    x = rw * Math.cos(@angle / 180 * Math.PI)
    y = rh * Math.sin(@angle / 180 * Math.PI)
    g.translate @w/2, @h/2 #------------------push

    g.rotate -Math.PI / 6

    g.fillStyle = @color
    g.beginPath()
    g.ellipse x, y, 20, 20
    g.fill()

    g.rotate Math.PI / 6
    g.translate -@w/2, -@h/2 #------------------pop


module?.exports = Planet
