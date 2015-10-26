app = angular.module 'bookexchange'

app.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise('/books')

    $stateProvider
      .state 'notifications',
        abstract: true
        controller: 'NavigationController'
        templateUrl: '/templates/navigation/index.html'

      .state 'notifications.new',
        url: '/notifications/new'
        controller: 'NotificationsController'
        templateUrl: '/templates/notifications/new.html'
        resolve:
          notification: -> {}
]
