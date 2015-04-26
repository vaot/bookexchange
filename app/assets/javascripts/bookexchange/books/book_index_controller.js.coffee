app = angular.module "bookexchange"

app.controller "BookIndexController", [
  '$scope'
  'books'
  '$state'
  'AVAILABLE_CATEGORIES'
  ($scope, books, $state, AVAILABLE_CATEGORIES) ->
    $scope.books = books
    $scope.availableCategories = AVAILABLE_CATEGORIES

]
