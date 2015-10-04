app = angular.module 'bookexchange'

app.service 'BooksService', [
  'BooksResource'
  (
    BooksResource
  ) ->
    api = {}

    getBookAuthors = (info) ->
      (info.authors ? []).join(', ')

    getBookISBN = (info) ->
      info.industryIdentifiers[0]?.identifier

    api.save = (params = {}) ->
      BooksResource.save(params).$promise

    api.update = (params = {}) ->
      BooksResource.update(params).$promise

    api.query = (params = {}) ->
      BooksResource.query(params).$promise

    api.copyFromGoogle = (book, data) ->
      book.title       = data.volumeInfo.title
      book.tags        = data.volumeInfo.categories
      book.description = data.volumeInfo.description
      book.isbn        = getBookISBN(data.volumeInfo)
      book.author      = getBookAuthors(data.volumeInfo)

      book.cover_url =
        medium: data.volumeInfo.imageLinks.thumbnail
        small:  data.volumeInfo.imageLinks.thumbnail

    api

]
