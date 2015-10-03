app = angular.module "bookexchange"

app.service "BookService", [
  "$resource"
  ($resource) ->

    resource =
      $resource("/api/v1/books/:id.json", { id: "@id" }, {
        update:
          method: 'PUT'
      })

    mixin =
      copyFromGoogle: (scope, bookInfo) ->
        scope.book.title = bookInfo.volumeInfo.title
        scope.book.author = bookInfo.volumeInfo.authors.join(" ,")
        scope.book.isbn = bookInfo.volumeInfo.industryIdentifiers[0]?.identifier
        scope.book.tags = bookInfo.volumeInfo.categories
        scope.book.cover_url = {}
        scope.book.cover_url.medium = bookInfo.volumeInfo.imageLinks.thumbnail
        scope.book.cover_url.small = bookInfo.volumeInfo.imageLinks.thumbnail


    angular.extend(resource, mixin)
]
