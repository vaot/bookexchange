app = angular.module "bookexchange"

app.controller "BidsController", [
  '$scope'
  'bidsResource'
  'BidsService'
  '$state'
  '$upload'
  'UserService'
  ($scope, bidsResource, BidsService, $state, $upload, UserService) ->
    $scope.bids = bidsResource

    $scope.create = ->
      BidsService.save(angular.extend({ book_id: $scope.book.id}, $scope.bid))
        .$promise.then (re) ->
          console.log(re)

]
