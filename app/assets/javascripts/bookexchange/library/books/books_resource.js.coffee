app = angular.module 'bookexchange'

app.service 'BooksResource', [
  '$resource'
  (
    $resource
  ) ->
    url = '/api/v1/books/:id.json'

    params =
      id: '@id'

    actions =
      update:
        method: 'PUT'

    $resource(url, params, actions)
]
