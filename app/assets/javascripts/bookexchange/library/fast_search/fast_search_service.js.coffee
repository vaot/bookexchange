app = angular.module 'bookexchange'

app.service 'FastSearchService', [
  'FastSearchResource'
  (
    FastSearchResource
  ) ->
    api = {}

    api.search = (query) ->
      FastSearchResource.search(query: query).$promise

    api

]
