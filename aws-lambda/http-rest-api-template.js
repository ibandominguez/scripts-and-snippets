'use strict'

exports.handler = async (event) => {
  let request = {
    method: event.httpMethod,
    headers: event.headers,
    params: event.queryStringParameters,
    body: event.body
  }

  let response = {
    statusCode: 200,
    headers: {
      ...request.headers,
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': true,
      'Content-type': 'application/json'
    }
  }

  // Parse request body
  try {
    request.body = JSON.parse(event.body)
  } catch (error) {
    response.statusCode = 500
    response.body = JSON.stringify({ error })
  }

  response.body = JSON.stringify({ request })

  return response
}
