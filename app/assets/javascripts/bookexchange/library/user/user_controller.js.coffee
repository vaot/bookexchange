app = angular.module 'bookexchange'

app.controller 'UserController', [
  '$scope'
  'userBooksResource'
  'UserService'
  'BooksService'
  (
    $scope
    userBooksResource
    UserService
    BooksService
  ) ->
    $scope.books = userBooksResource
    $scope.currentUser = UserService.currentUser()

    $scope.deleteBook = (book) ->
      NProgress.start()

      BooksService.delete(id: book.id).then (response) ->
        if response.success
          index = $scope.books.indexOf(book)
          return unless index > -1
          $scope.books.splice(index, 1)
        else
          Utils.log('alert', 'Something went wrong. Fix it!', response)

        NProgress.done()
]
