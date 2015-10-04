app = angular.module 'bookexchange'

app.controller 'UserController', [
  '$scope'
  'userBooksResource'
  (
    $scope
    userBooksResource
  ) ->
    $scope.books = userBooksResource
]
