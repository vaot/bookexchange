app = angular.module "bookexchange"

app.controller "UserController", [
  "$scope"
  "books"
  ($scope, books) ->
    $scope.books = books
]
