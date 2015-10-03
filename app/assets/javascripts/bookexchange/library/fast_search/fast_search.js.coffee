app = angular.module 'bookexchange'

app.directive 'fastSearch', [
  '$timeout'
  'FastSearchService'
  (
    $timeout
    FastSearchService
  ) ->
    link: (scope, element, attributes) ->
      searching = null

      liveSearch = ->
        FastSearchService.search(scope.searchQuery).then (response) ->
          scope.results = response.search
          searching = $timeout.cancel(searching)

      scope.liveSearch = ->
        searching ?= $timeout(liveSearch, 1000)

    templateUrl: '/bookexchange/library/fast_search/search.html'
]
