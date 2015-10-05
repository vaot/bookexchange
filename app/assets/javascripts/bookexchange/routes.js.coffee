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

    $urlRouterProvider.otherwise('/books')

    $stateProvider
      .state 'books',
        abstract: true
        controller: 'NavigationController'
        templateUrl: '/bookexchange/library/navigation/navigation.html'

      .state 'books.index',
        url: '/books'
        views:
          '':
            templateUrl: '/bookexchange/library/books/templates/index.html'
            controller: 'BookCategoryController'
          'cover@books':
            templateUrl: '/bookexchange/library/navigation/cover.html'

      .state 'books.new',
        url: '/books/new'
        templateUrl: '/bookexchange/library/books/templates/new.html'
        controller: 'BookController'
        resolve:
          bookResource: -> {}

      .state 'books.edit',
        url: '/books/:id/edit'
        templateUrl: '/bookexchange/library/books/templates/edit.html'
        controller: 'BookController'
        resolve:
          bookResource: [
            'BooksResource'
            '$stateParams'
            (BooksResource, $stateParams) ->
              BooksResource.get(id: $stateParams.id).$promise
          ]

      .state 'books.show',
        url: '/books/:id'
        views:
          '':
            templateUrl: '/bookexchange/library/books/templates/show.html'
            controller: 'BookController'
            resolve:
              bookResource: [
                'BooksResource'
                '$stateParams'
                (BooksResource, $stateParams) ->
                  BooksResource.get(id: $stateParams.id).$promise
              ]
          'bids@books.show':
            templateUrl: '/bookexchange/library/book_bids/book_bids.html'
            controller: 'BookBidsController'
            resolve:
              bidsResource: [
                '$stateParams'
                'BookBidsResource'
                ($stateParams, BookBidsResource) ->
                  BookBidsResource.query(book_id: $stateParams.id).$promise
              ]

      .state 'users',
        abstract: true
        controller: 'NavigationController'
        templateUrl: '/bookexchange/library/navigation/navigation.html'

      .state 'users.show',
        url: '/users/:id'
        controller: 'UserController'
        templateUrl: '/bookexchange/library/user/show.html'
        resolve:
          userBooksResource: -> []

      .state 'users.books',
        url: '/users/:id/books'
        controller: 'UserController'
        templateUrl: '/bookexchange/library/user/books.html'
        resolve:
          userBooksResource: [
            'BooksResource'
            '$stateParams'
            (BooksResource, $stateParams) ->
              BooksResource.query(user_id: $stateParams.id).$promise
          ]

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
