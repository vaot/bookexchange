app = angular.module 'bookexchange'

app.directive 'bookCategory', [
  'BooksService'
  (
    BooksService
  ) ->
    scope:
      category: '=bookCategory'
    link: (scope, element, attributes) ->
      console.log scope.category.filter
      # BooksService.query(filter: scope.category.filter).then (result) ->
      #   $scope.books = result
      #   debugger
    templateUrl: '/bookexchange/library/book_category/category.html'
]
