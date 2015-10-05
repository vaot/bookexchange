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

    $scope.deleteBook = (bookId) ->
      BooksService.delete(id: bookId).then (response) ->
        if response.success
          window.location.reload() # TODO
        else
          Utils.log('alert', 'Something went wrong. Fix it!', response)

]
