app = angular.module 'bookexchange'

app.service 'BookBidsResource', [
  '$resource'
  (
    $resource
  ) ->
    url = '/api/v1/bids/:id.json'

    params =
      id: '@id'

    actions =
      update:
        method: 'PUT'

    $resource(url, params, actions)

]
