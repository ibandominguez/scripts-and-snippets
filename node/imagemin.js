'use strict'

/** 
 * The following deps are required in order to make use of this
 * Script
 *
 * System deps: graphicsmagick
 * Npm deps: gulp, gulp-image-resize, gulp-imagemin and imagemin-pngquant
 */

const gulp = require('gulp')
const imageresize = require('gulp-image-resize')
const imagemin = require('gulp-imagemin')
const pngquant = require('imagemin-pngquant')

gulp.task('images', () => {
  return gulp
    .src('source/*')
    .pipe(imageresize({
      width: 1200,
      crop: false,
      upscale: false
    }))
    .pipe(imagemin({
      progressive: true,
      svgoPlugins: [{ removeViewBox: false }],
      use: [pngquant()]
    }))
    .pipe(gulp.dest('target/'))
})
