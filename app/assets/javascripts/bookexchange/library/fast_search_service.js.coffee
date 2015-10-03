app = angular.module "bookexchange"

app.service "FastSearch", [
  "$resource"
  ($resource) ->
    $resource("/api/v1/search.json", {}, {
      search:
        method: 'get'
    })
]
