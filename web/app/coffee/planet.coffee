#planet.coffee

class Planet
  constructor: (arg)->
    cnt = arg or 0
    id = if cnt.id then cnt.id else 0
    width = if cnt.width then cnt.width else 0
    height = if cnt.height then cnt.height else 0
    speed = if cnt.speed then cnt.speed else 0

    @canvas = document.getElementById id
    @canvas.width = width
    @canvas.height = height
    @ctx = @canvas.getContext "2d"
    @w = width
    @h = height
    @angle = 0.0
    @speed = speed

  animate: ()=>
    window.requestAnimationFrame @animate
    ctx = @ctx

    ctx.clearRect 0, 0, @w, @h
    
    ctx.fillStyle = '#000'
    ctx.ellipse @w/2, @h/2, 52, 52
    ctx.fill()

    
    ctx.translate @w/2, @h/2 #------------------push

    ctx.rotate -Math.PI / 6

    ctx.strokeStyle = '#000'
    ctx.beginPath()
    ctx.ellipse 0, 0, 124, 18
    ctx.stroke()

    ctx.rotate Math.PI / 6
    ctx.translate -@w/2, -@h/2 #------------------pop
    
    @angle += @speed
    rw = 62.0
    rh = 9.0
    x = rw * Math.cos(@angle / 180 * Math.PI)
    y = rh * Math.sin(@angle / 180 * Math.PI)
    ctx.translate @w/2, @h/2 #------------------push

    ctx.rotate -Math.PI / 6

    ctx.fillStyle = '#000'
    ctx.beginPath()
    ctx.ellipse x, y, 20, 20
    ctx.fill()

    ctx.rotate Math.PI / 6
    ctx.translate -@w/2, -@h/2 #------------------pop


