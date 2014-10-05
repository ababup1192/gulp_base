# plugins
gulp = require 'gulp'
gulpBowerFiles = require 'main-bower-files'
gulpFlatten = require 'gulp-flatten'
gulpFilter = require 'gulp-filter'
gulpJade = require 'gulp-jade'
gulpCoffee = require 'gulp-coffee'
gulpConnect = require 'gulp-connect'

# Tasks

gulp.task 'bower', ->
  jsFilter = gulpFilter('**/*.js')
  cssFilter = gulpFilter('**/*.css')
  # import js libraries
  gulp.src(gulpBowerFiles())
    .pipe(jsFilter)
    .pipe(gulp.dest('./dist/lib/js'))
  # import css libraries
    .pipe(cssFilter)
    .pipe(gulp.dest('./dist/lib/css'))

# local server
gulp.task 'connect', ->
  gulpConnect.server(
    root: 'dist'
    livereload: true
  )

gulp.task 'jade', ->
  gulp.src('./jade/**/*.jade')
    .pipe(gulpJade(pretty: true))
    .pipe(gulp.dest('./dist'))
    .pipe(gulpConnect.reload())

gulp.task 'coffee', ->
  gulp.src('./coffee/**/*.coffee')
    .pipe(gulpCoffee(bare: true))
    .pipe(gulp.dest('./dist/js/'))
    .pipe(gulpConnect.reload())

gulp.task 'watch', ->
  gulp.watch(
    ['./jade/**/*.jade', './coffee/**/*.coffee'],
    ['jade', 'coffee']
  )

gulp.task 'info', ->
  console.log "Please connect http://dockerhost:8080"

gulp.task 'default', ['jade', 'coffee', 'connect', 'watch', 'info']

