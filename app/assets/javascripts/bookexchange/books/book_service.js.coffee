app = angular.module "bookexchange"

app.service "BookService", [
  "$resource"
  ($resource) ->
    $resource("/api/v1/books/:id.json")
]
