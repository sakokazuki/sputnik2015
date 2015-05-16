
Planet = require "./planet.coffee"
Loading = require "./loading.coffee"
GSAP = require("./gsap.coffee")
howler = require "howler"

#test
$(document).ready ()->
  console.log howler
  planet = new Planet
    id: "canvas_plnaet"
    width: 153
    height: 90
    speed: 0.5
  planet.animate()

  loading = new Loading
    id: "canvas_loading"
    width: 100
    height: 100
    speed1: 9
    speed2: 6
  loading.animate()

  $body = $("body")
  $body.css({opacity:0})

  # animationのテスト
  TweenMax.to($body, 1.6, {opacity:1.0})

  # sliderの実装
  $("#top-slider").sliderPro
    width: $(window).width()*0.90
    height: $(window).height()*0.88
    arrows: false
    buttons: false
    waitForLayers: true
    autoplay: true
    autoScaleLayers: false
    imageScaleMode: 'cover'
    slideDistance:150

  $("*[href]").on "click", ->
    location.href = $(this).attr "href"
