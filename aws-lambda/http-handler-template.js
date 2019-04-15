'use strict'

exports.handler = async (event) => {
  // event.headers : Object
  // event.queryStringParameters : Object (null if empty)
  // event.body : String (null if empty)

  return {
    statusCode: 200,
    body: JSON.stringify(event)
  }
}
