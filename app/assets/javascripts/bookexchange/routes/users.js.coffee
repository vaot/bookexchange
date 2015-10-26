app = angular.module 'bookexchange'

app.config [
  '$stateProvider'
  ($stateProvider) ->

    $stateProvider
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
]
