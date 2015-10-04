app = angular.module 'bookexchange'

app.controller 'NavigationController', [
  '$scope'
  'UserService'
  (
    $scope
    UserService
  ) ->

    $scope.currentUser = UserService.currentUser()

    userOwnsBook = (book) ->
      book and book.user_id is $scope.currentUser.id

    $scope.currentUser.canEdit = (book) ->
      $scope.currentUser.logged_in and userOwnsBook(book)
]
