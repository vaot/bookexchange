app = angular.module "bookexchange"

app.controller "BookIndexController", [
  '$scope'
  'books'
  '$state'
  ($scope, books, $state) ->
    $scope.books = books
]
