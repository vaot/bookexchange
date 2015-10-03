app = angular.module 'bookexchange'

app.controller 'BidsController', [
  '$scope'
  'BookBids'
  'BookBidsService'
  (
    $scope
    BookBids
    BookBidsService
  ) ->
    $scope.bids = BookBids || []

    $scope.create = ->
      params = angular.extend(book_id: $scope.book.id, $scope.bid)

      BookBidsService.save(params).then (response) ->
        $scope.bids.push(response.bid)

]
