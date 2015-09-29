app = angular.module "bookexchange"

app.directive "fastSearch", [
  'FastSearch'
  '$timeout'
  (FastSearch, $timeout) ->
    link: (scope, element, attributes) ->
      delay = null

      scope.liveSearch = ->
        return if delay
        delay =
          $timeout(
            ->
              FastSearch.search(query: scope.searchQuery).$promise.then (result) ->
                scope.searchResults = result.search
                delay = $timeout.cancel(delay)
          , 2000)

    templateUrl: "/templates/library/fast_search.html"
]
