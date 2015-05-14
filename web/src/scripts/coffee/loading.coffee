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

  ###
    こういうのを書くときのポイント
    1.機能ごとに関数を分ける。関数は入れ子にすれば管理も簡単。その時の関数の命名は、
      一目見て何をしてるかわかるようにする
    2.共通化出来るものは、絶対に共通化する
    3.同じ処理を繰り返してはだめ。forループ沢山使っていこう。
  ###
  animate: ()=>
    requestAnimationFrame @animate
    g = @ctx
    w = @width
    h = @height


    g.clearRect 0, 0, w, h

    g.fillStyle = '#000'
    g.strokeStyle = '#000'

    #円を描く
    for v,i in [0.3,0.5,0.8]
      g.ellipse w/2, h/2, w*v, h*v
      if i is 0 then g.fill() else g.stroke()

    @angle1 += @speed1
    rw = w*0.3 - 5
    rh = h*0.3 - 5
    x = rw * Math.cos(@angle1 / 180 * Math.PI)
    y = rh * Math.sin(@angle1 / 180 * Math.PI)
    g.translate w/2, h/2
    #------------------push


    g.beginPath()
    g.ellipse x, y, 10, 10
    g.fill()

    #------------------pop
    g.translate -w/2, -h/2

    @angle2 += @speed2
    rw = w*0.5 - 10
    rh = h*0.5 - 10
    x = rw * Math.cos(@angle2 / 180 * Math.PI)
    y = rh * Math.sin(@angle2 / 180 * Math.PI)
    g.translate w/2, h/2
    #------------------push

    g.fillStyle = '#000'
    g.beginPath()
    g.ellipse x, y, 20, 20
    g.fill()

    g.translate -w/2, -h/2
    #------------------pop


module?.exports = Loading
