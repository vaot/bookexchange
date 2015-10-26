app = angular.module 'bookexchange'

app.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
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
]
