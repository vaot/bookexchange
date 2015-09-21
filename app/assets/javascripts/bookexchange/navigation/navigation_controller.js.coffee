app = angular.module "bookexchange"

app.controller "NavigationController", [
  "$scope"
  "$rootScope"
  "UserService"
  ($scope, $rootScope, UserService) ->
    $scope.currentUser = UserService.currentUser()

    $scope.currentUser.canEdit = (book) ->
      return false unless book?
      $scope.currentUser.logged_in && ($scope.currentUser.id == book.user_id)
]
