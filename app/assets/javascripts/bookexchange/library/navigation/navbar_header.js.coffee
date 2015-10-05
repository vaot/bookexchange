app = angular.module 'bookexchange'

app.directive 'navbarHeader', [
  '$rootScope'
  ($rootScope) ->
    transclude: true
    link: (scope, element, attributes) ->
      $rootScope.expandSidebar ?= true

      scope.toggleSidebar = ->
        $rootScope.expandSidebar = !$rootScope.expandSidebar

    templateUrl: '/bookexchange/library/navigation/navbar_header_collapse.html'
]
