app = angular.module 'bookexchange'

app.run [
  '$templateCache'
  ($templateCache) ->
    angular.forEach JST,
      (template, template_name) ->
        @put "/#{template_name}.html", template({})
      , $templateCache
]

app.run [
  '$rootScope'
  ($rootScope) ->

    $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
      if fromState.name is 'books.show'
        $rootScope.themeColor = ""
]

app.config [
  '$httpProvider'
  '$locationProvider'
  ($httpProvider, $locationProvider) ->
    $locationProvider.html5Mode(true)
    $locationProvider.hashPrefix('!')

    $httpProvider.interceptors.push 'AuthKeyInterceptor'
]
