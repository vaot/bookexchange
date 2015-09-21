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
  '$httpProvider'
  ($httpProvider) ->
    $httpProvider.interceptors.push 'AuthKeyInterceptor'
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
        views:
          '':
            templateUrl: '/templates/books/index.html'

          'cover@books':
            templateUrl: '/templates/navigation/cover.html'

          'popular_section@books.index':
            templateUrl: '/templates/categories/index.html'
            controller: 'BookIndexController'
            resolve:
              books: [
                "BookService"
                (BookService) ->
                  BookService.query(tags: 'sfu').$promise
              ]

          'newly_added@books.index':
            templateUrl: '/templates/categories/index.html'
            controller: 'BookIndexController'
            resolve:
              books: [
                "BookService"
                (BookService) ->
                  BookService.query(filter: 'newly_added').$promise
              ]

      .state 'books.new',
        url: '/books/new'
        templateUrl: '/templates/books/new.html'
        controller: 'BookController'
        resolve:
          bookResource: -> {}

      .state 'books.edit',
        url: '/books/:id/edit'
        templateUrl: '/templates/books/edit.html'
        controller: 'BookController'
        resolve:
          bookResource: [
            "BookService"
            '$stateParams'
            (BookService, $stateParams) ->
              BookService.get(id: $stateParams.id).$promise
          ]

      .state 'books.show',
        url: '/books/:id'
        views:
          '':
            templateUrl: '/templates/books/show.html'
            controller: 'BookController'
            resolve:
              bookResource: [
                "BookService"
                "$stateParams"
                (BookService, $stateParams) ->
                  BookService.get(id: $stateParams.id).$promise
              ]
          'bids@books.show':
            templateUrl: '/templates/bids/index.html'
            controller: 'BidsController'
            resolve:
              bidsResource: [
                "BidsService"
                "$stateParams"
                (BidsService, $stateParams) ->
                  BidsService.query(book_id: $stateParams.id).$promise
              ]

      .state 'users',
        abstract: true
        controller: 'NavigationController'
        templateUrl: '/templates/navigation/index.html'

      .state 'users.show',
        url: '/users/:id'
        controller: 'UserController'
        templateUrl: '/templates/user/show.html'
        resolve:
          books: -> []

      .state 'users.books',
        url: '/users/:id/books'
        controller: 'UserController'
        templateUrl: '/templates/user/books.html'
        resolve:
          books: [
            "BookService"
            "$stateParams"
            (BookService, $stateParams) ->
              BookService.query(user_id: $stateParams.id).$promise
          ]

]
