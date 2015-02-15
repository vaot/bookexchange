app = angular.module "bookexchange"

app.run [
  '$templateCache'
  ($templateCache) ->
    angular.forEach JST,
      (template, template_name) ->
        this.put "/#{template_name}.html", template({})
      , $templateCache
]

app.config [
  '$stateProvider'
  '$urlRouterProvider'
  '$locationProvider'
  '$httpProvider'
  ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) ->
    $locationProvider.html5Mode(true)
    $locationProvider.hashPrefix('!')

    $stateProvider

      .state 'books',
        abstract: true
        controller: 'NavigationController'
        templateUrl: '/templates/navigation/index.html'

      .state 'books.index',
        url: '/books'
        templateUrl: '/templates/books/index.html'
        controller: 'BookController'
        resolve:
          books: [
            "BookService"
            (BookService) ->
              BookService.query().$promise
          ]
]
