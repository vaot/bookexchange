app = angular.module 'bookexchange'

app.controller 'BookBidsController', [
  '$scope'
  'bidsResource'
  'BookBidsService'
  (
    $scope
    bidsResource
    BookBidsService
  ) ->
    $scope.bids = bidsResource || []

    $scope.create = ->
      params = angular.extend(book_id: $scope.book.id, $scope.bid)

      BookBidsService.save(params).then (response) ->
        $scope.bids.push(response.bid)
]
