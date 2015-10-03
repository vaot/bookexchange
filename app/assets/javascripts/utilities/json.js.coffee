window.Utils ?= {}

Utils.parseJson = (json) ->
  try
    JSON.parse(json)
  catch e
    Utils.log('error', 'Unable to parse json', json)
