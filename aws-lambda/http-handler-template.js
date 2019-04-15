'use strict'

exports.handler = async (event) => {
  // event.headers : Object
  // event.queryStringParameters : Object (null if empty)
  // event.body : String (null if empty)

  return {
    statusCode: 200,
    headers: { 'Content-type': 'application/json' },
    body: JSON.stringify(event)
  }
}
