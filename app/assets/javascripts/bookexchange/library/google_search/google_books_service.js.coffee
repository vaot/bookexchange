app = angular.module 'bookexchange'

app.service 'GoogleBooksService', [
  '$http'
  (
    $http
  ) ->

    API_ENDPOINT = 'https://www.googleapis.com/books/v1/volumes'

    QUERIES =
      isbn:    'isbn'
      title:   'intitle'
      author:  'inauthor'
      subject: 'subject'

    apiCall = (query) ->
      $http.get("#{API_ENDPOINT}?q=#{query}")

    getBookAuthors = (info) ->
      (info.authors ? []).join(', ')

    getBookISBN = (info) ->
      info.industryIdentifiers[0]?.identifier

    api = {}

    api.search = (query = {}) ->
      if (key = Object.keys(query)[0]) in Object.keys(QUERIES)
        apiCall("#{QUERIES[key]}:#{query[key]}")

    api.copyDetails = (book, data) ->
      book.title       = data.volumeInfo.title
      book.tags        = data.volumeInfo.categories
      book.description = data.volumeInfo.description
      book.isbn        = getBookISBN(data.volumeInfo)
      book.author      = getBookAuthors(data.volumeInfo)

      book.cover_url =
        medium: data.volumeInfo.imageLinks.thumbnail
        small:  data.volumeInfo.imageLinks.thumbnail

      book

    api

]
