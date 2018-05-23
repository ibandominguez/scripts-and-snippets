'use strict'

const fs = require('fs')
const path = require('path')

/**
 * @param  {Date} date
 * @return {string}
 */
const getFormattedDate = (date) => {
  let dd = date.getDate()
  let mm = date.getMonth() + 1
  let yyyy = date.getFullYear()

  if (dd < 10) {
    dd = `0${dd}`
  }

  if (mm < 10) {
    mm = `0${mm}`
  }

  return `${dd}-${mm}-${yyyy}`
}

/**
 * @param  {string}
 * @return {string[]}
 */
const getAllFiles = dir => {
  return fs.readdirSync(dir).reduce((files, file) => {
    const name = path.join(dir, file);
    const isDirectory = fs.statSync(name).isDirectory();
    return isDirectory ? [...files, ...getAllFiles(name)] : [...files, name];
  }, []);
}

/**
 * Use Example
 */

const SOURCE_DIRECTORY = '/Users/ibandominguez/Desktop/'
const allFiles = getAllFiles(SOURCE_DIRECTORY)

allFiles.map((file) => {
  const fileData = fs.statSync(file)
  const destinationPath = path.join(SOURCE_DIRECTORY, getFormattedDate(fileData.birthtime))

  if (!fs.existsSync(destinationPath)) {
    fs.mkdirSync(destinationPath)
  }

  fs.copyFileSync(file, path.join(destinationPath, path.basename(file)))
})
