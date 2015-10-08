app = angular.module 'bookexchange'

app.controller 'NavigationController', [
  '$scope'
  '$state'
  'UserService'
  'BooksService'
  (
    $scope
    $state
    UserService
    BooksService
  ) ->

    $scope.currentUser = UserService.currentUser()

]
