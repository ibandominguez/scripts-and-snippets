'use strict'

const CHARACTERS = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
const CODES_SIZE = 5
const AMOUNT = 100

const makeCode = () => {
  return new Array(CODES_SIZE).fill(null).map(() => {
    return CHARACTERS[Math.floor(Math.random() * CHARACTERS.length)]
  }).join('')
}

const codes = new Array(AMOUNT).fill(null).map((code, index, codes) => {
  code = makeCode()
  while (codes.includes(code)) {
    code = makeCode()
  }
  return code
})

console.log(
  codes.join('\n')
)
