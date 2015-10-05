app = angular.module 'bookexchange'

app.controller 'BookController', [
  '$scope'
  '$state'
  'bookResource'
  'BooksService'
  'Upload'
  'UserService'
  'GoogleBooksService'
  '$rootScope'
  (
    $scope
    $state
    bookResource
    BooksService
    Upload
    UserService
    GoogleBooksService
    $rootScope
  ) ->

    $scope.book = bookResource.book ? {}
    $rootScope.themeColor = $scope.book.dominant_color

    $scope.bookFormActive = false

    $scope.isbnSearch =
      query: ''
      enabled: true
      results: []

    $scope.search = (query) ->
      return unless query.isbn.length > 0
      GoogleBooksService.search(query).then (response) ->
        $scope.isbnSearch.results = response.data.items

    $scope.setBookDetails = (info) ->
      GoogleBooksService.copyDetails($scope.book, info)
      $scope.isbnSearch.enabled = false
      $scope.showForm()

    $scope.create = ->
      angular.extend($scope.book, user_id: UserService.currentUser('id'))

      BooksService.save($scope.book).then (response) ->
        $state.go('books.show', id: response.book.id)

    $scope.update = ->
      BooksService.update($scope.book).then (response) ->
        $state.go('books.show', id: $scope.book.id)

    $scope.addTag = (tag, book = $scope.book) ->
      return unless tag?
      book.tags ?= []
      return if tag in book.tags
      book.tags.push(tag)

    $scope.showForm = ->
      $scope.bookFormActive = true

    $scope.hideForm = ->
      $scope.bookFormActive = false

    $scope.upload = (files) ->
      for file in files
        progressFn = (event) ->
          progress = parseInt(100.0 * event.loaded / event.total)
          console.log('progress: ' + progress)

        successFn = (data, status, headers, config) ->
          $scope.book.book_cover =
            id: data.id

        options =
          url: '/api/v1/medias'
          data:
            attachment: file

        Upload.upload(options).progress(progressFn).success(successFn)
]
