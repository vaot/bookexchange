app = angular.module 'bookexchange'

app.service 'ColorService', [
  ->
    api = {}

    api.hexToRgb = (hex) ->
      match = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex)

      result =
        if match
          r: parseInt(match[1], 16)
          g: parseInt(match[2], 16)
          b: parseInt(match[3], 16)
        else
          null

      result


    api.rgbToString = (rgba, opacity = 1) ->
      result = "rgba("

      for key, value of rgba
        result += value
        result += ","

      result += opacity
      result += ")"
      result

    api
]
