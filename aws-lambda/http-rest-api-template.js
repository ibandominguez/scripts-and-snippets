'use strict'

exports.handler = async (event) => {
  // event.headers : Object
  // event.queryStringParameters : Object (null if empty)
  // event.body : String (null if empty)

  let response = {
    statusCode: 200,
    headers: {
      ...event.headers,
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': true,
      'Content-type': 'application/json'
    }
  }

  try {
    event.body = JSON.parse(event.body)
  } catch (error) {
    response.body = JSON.stringify({ error })
    return response
  }

  response.body = JSON.stringify(event)
  return response
}
