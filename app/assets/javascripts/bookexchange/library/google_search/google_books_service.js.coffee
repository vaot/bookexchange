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

    api = {}

    api.search = (query = {}) ->
      if (key = Object.keys(query)[0]) in Object.keys(QUERIES)
        apiCall("#{QUERIES[key]}:#{query[key]}")

    api

]
