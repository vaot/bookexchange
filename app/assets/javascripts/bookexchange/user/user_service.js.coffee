app = angular.module "bookexchange"

app.service "UserService", [
  "$rootScope"
  ($rootScope) ->
    api =
      currentUser: ->
        try
          JSON.parse($rootScope.serverData)
        catch e
          console.log("Error: Unable to parse serverData")
    return api

]
