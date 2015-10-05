app = angular.module "bookexchange"

app.controller "NotificationsController", [
  "$scope"
  'notification'
  ($scope, notification) ->
    $scope.notification = notification

]
