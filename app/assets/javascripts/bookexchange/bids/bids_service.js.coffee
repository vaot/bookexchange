app = angular.module "bookexchange"

app.service "BidsService", [
  "$resource"
  ($resource) ->
    $resource("/api/v1/bids/:id.json", { id: "@id" }, {
      update:
        method: 'PUT'
    })
]
