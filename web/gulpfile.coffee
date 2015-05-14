config = require './package.json'
gulp = require 'gulp'
plumber = require 'gulp-plumber'
sourcemaps = require 'gulp-sourcemaps'


#gulp-sassの読み込みはこちら
# ------------------------------------------------
gulp.task 'sass', ->
  sass = require 'gulp-sass'
  gulp.src "#{config.path.src.styles}/sass/**/*.{sass,scss}"
    .pipe sourcemaps.init()
    .pipe plumber()
    .pipe sass()
    .pipe sourcemaps.write()
    .pipe gulp.dest config.path.build.css

# Browserifyのもろもろはこちら。
# ------------------------------------------------
gulp.task 'browserify', ->
  browserify = require 'browserify'
  source = require 'vinyl-source-stream'
  buffer = require 'vinyl-buffer'
  browserify "#{config.path.src.scripts}/coffee/main.coffee",
    extention: ['coffee','js']
    debug: true
  .transform 'coffeeify'
  .bundle()
  .pipe plumber()
  .pipe source 'bundle.js'
  .pipe buffer()
  .pipe plumber()
  .pipe sourcemaps.init
    loadMaps: true
  .pipe sourcemaps.write()
  .pipe gulp.dest config.path.build.js

# もろもろクローンするやつ
# ------------------------------------------------
gulp.task 'copy', ->
  gulp.src "src/scripts/lib/*.js"
  .pipe gulp.dest "#{config.path.build.js}/lib"

  gulp.src "src/styles/lib/*.css"
  .pipe gulp.dest "#{config.path.build.css}/lib"

  gulp.src "src/images/**/*"
  .pipe gulp.dest 'build/assets/img'

  gulp.src "#{config.path.src.base}/*.html"
  .pipe gulp.dest 'build/'

# Browserリロードと監視
# ------------------------------------------------
browserSync = require('browser-sync').create()
reload      = browserSync.reload
gulp.task 'watch', ->
  browserSync.init
    server: "./build"
  gulp.watch "#{config.path.src.styles}/sass/**/*.sass", ["sass",reload]
  gulp.watch "#{config.path.src.scripts}/coffee/**/*.coffee", ["browserify",reload]
  gulp.watch "#{config.path.src.base}/*.html", ["copy", reload]

gulp.task 'default', ["sass","browserify","copy", "watch"]
