app = angular.module 'bookexchange'

app.service 'ServerData', [
  '$rootScope'
  (
    $rootScope
  ) ->

    getData = ->
      @data ?= Utils.parseJson($rootScope.serverData)

    api = {}

    api.get = (property) ->
      if property
        getData()[property]
      else
        getData()

    api

]
