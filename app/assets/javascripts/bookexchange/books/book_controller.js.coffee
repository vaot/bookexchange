app = angular.module "bookexchange"

app.controller "BookController", [
  "$scope"
  "books"
  ($scope, books) ->
    $scope.books = books;
]
