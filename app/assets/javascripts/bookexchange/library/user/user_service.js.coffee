app = angular.module 'bookexchange'

app.service 'UserService', [
  '$rootScope'
  (
    $rootScope
  ) ->

    api = {}

    currentUser = ->
      if @_currentUser?
        @_currentUser
      else
        @_currentUser = Utils.parseJson($rootScope.serverData)

    api.currentUser = (property) ->
      if property?
        currentUser()[property]
      else
        currentUser()

    api

]
