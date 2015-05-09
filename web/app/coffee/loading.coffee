#read.coffee

class Loading
  constructor: (arg)->
    cnt = arg or 0
    id = if cnt.id then cnt.id else 0
    width = if cnt.width then cnt.width else 0
    height = if cnt.height then cnt.height else 0
    speed1 = if cnt.speed1 then cnt.speed1 else 0
    speed2 = if cnt.speed2 then cnt.speed2 else 0

    @canvas = document.getElementById id
    @canvas.width = width
    @canvas.height = height
    @ctx = @canvas.getContext "2d"
    @width = width
    @height = height
    @angle1 = Math.random() * 360
    @angle2 = Math.random() * 360
    @speed1 = speed1
    @speed2 = speed2

  animate: ()=>
    window.requestAnimationFrame @animate
    ctx = @ctx
    w = @width
    h = @height


    ctx.clearRect 0, 0, w, h
    # ctx.fillStyle = '#eee'
    # ctx.fillRect 0, 0, w, h
    # ctx.fill()

    ctx.fillStyle = '#000'
    ctx.strokeStyle = '#000'
    ctx.ellipse w/2, h/2, 50, 50
    ctx.fill()
    ctx.ellipse w/2, h/2, 85, 85
    ctx.stroke()
    ctx.ellipse w/2, h/2, 120, 120
    ctx.stroke()

    @angle1 += @speed1
    rw = 42.5
    rh = 42.5
    x = rw * Math.cos(@angle1 / 180 * Math.PI)
    y = rh * Math.sin(@angle1 / 180 * Math.PI)
    ctx.translate w/2, h/2 #------------------push

    ctx.fillStyle = '#000'
    ctx.beginPath()
    ctx.ellipse x, y, 10, 10
    ctx.fill()

    ctx.translate -w/2, -h/2 #------------------pop

    @angle2 += @speed2
    rw = 60
    rh = 60
    x = rw * Math.cos(@angle2 / 180 * Math.PI)
    y = rh * Math.sin(@angle2 / 180 * Math.PI)
    ctx.translate w/2, h/2 #------------------push

    ctx.fillStyle = '#000'
    ctx.beginPath()
    ctx.ellipse x, y, 20, 20
    ctx.fill()

    ctx.translate -w/2, -h/2 #------------------pop


