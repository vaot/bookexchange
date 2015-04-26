app = angular.module "bookexchange"

app.controller "NavigationController", [
  "$scope"
  ($scope) ->
    $scope.tag = {}
    $scope.tag.predicates = []
    $scope.setPredicate = (tag) ->
      console.log "oiiiiiiiiiiiiiiiiiiiiiiiii"
      $scope.tag.predicates.push tag
]
