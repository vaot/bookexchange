app = angular.module 'bookexchange'

app.service 'FastSearchResource', [
  '$resource'
  (
    $resource
  ) ->
    url = '/api/v1/search.json'

    params = {}

    actions =
      search:
        method: 'get'

    $resource(url, params, actions)
]
