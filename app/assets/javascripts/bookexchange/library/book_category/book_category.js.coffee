app = angular.module 'bookexchange'

app.directive 'bookCategory', [
  'BooksService'
  (
    BooksService
  ) ->
    scope:
      category: '=bookCategory'
    link: (scope, element, attributes) ->
      debugger
      # BooksService.query(filter: scope.category.filter).then (result) ->
      #   $scope.books = result
      #   debugger
    templateUrl: '/bookexchange/library/book_category/book_category.html'
]
