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

      angular.element(document.body).bind 'click', ->
        scope.$apply ->
          scope.results = []
          scope.searchQuery = ''

      liveSearch = ->
        FastSearchService.search(scope.searchQuery).then (response) ->
          scope.results = response.search
          $timeout.cancel(searching)
          searching = null

      scope.liveSearch = ->
        searching ?= $timeout(liveSearch, 1000)

    templateUrl: '/bookexchange/library/fast_search/search.html'
]
