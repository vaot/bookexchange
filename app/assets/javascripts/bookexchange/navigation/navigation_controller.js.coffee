app = angular.module "bookexchange"

app.controller "NavigationController", [
  "$scope"
  ($scope) ->
    $scope.tag = {}
    $scope.tag.predicate = "all"
    $scope.setPredicate = (tag) ->
      console.log "oiiiiiiiiiiiiiiiiiiiiiiiii"
      $scope.tag.predicate = tag
]
