# plugins
gulp = require 'gulp'
gulpJade = require 'gulp-jade'
gulpConnect = require 'gulp-connect'

# Tasks

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

# watch tasks
gulp.task 'watch', ->
  gulp.watch(
    ['./jade/**/*.jade'],
    ['jade']
  )

gulp.task 'info', ->
  console.log "Please connect http://dockerhost:8080"

gulp.task 'default', ['connect', 'jade', 'watch' ,'info']

