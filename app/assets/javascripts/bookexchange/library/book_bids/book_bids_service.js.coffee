app = angular.module 'bookexchange'

app.service 'BookBidsService', [
  'BookBidsResource'
  (
    BookBidsResource
  ) ->
    api = {}

    api.save = (params = {}) ->
      BookBidsResource.save(params).$promise

    api
]
