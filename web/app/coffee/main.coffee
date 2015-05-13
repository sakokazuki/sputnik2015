#test
$(document).ready ()->

  planet = new Planet
    id: "canvas_plnaet"
    width: 153
    height: 90
    speed: 3
  planet.animate()

  loading = new Loading
    id: "canvas_loading"
    width: 152
    height: 144
    speed1: 5
    speed2: 3
  loading.animate()

  $("#top-slider").sliderPro
    width: $(window).width()
    height: $(window).height()*0.9
    arrows: true
    buttons: false
    waitForLayers: true
    autoplay: true
    autoScaleLayers: false
    imageScaleMode: 'cover'
    slideDistance:150
