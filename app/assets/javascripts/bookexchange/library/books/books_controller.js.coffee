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

    $scope.isbnLookUp ?= {}

    $scope.search = (query) ->
      GoogleBooksService.search(query).then (response) ->
        $scope.isbnLookUp.results = response.data.items

    $scope.setBookDetails = (info) ->
      BooksService.copyFromGoogle($scope.book, info)
      $scope.isbnLookUp.done = true

    $scope.create = ->
      NProgress.start()
      angular.extend($scope.book, user_id: UserService.currentUser('id'))

      BooksService.save($scope.book).then (response) ->
        NProgress.done()
        $state.go('books.index')

    $scope.update = ->
      BooksService.update($scope.book).then (response) ->
        $state.go('books.index')

    $scope.addTag = (tag, book = $scope.book) ->
      return unless tag?
      book.tags ?= []
      return if tag in book.tags
      book.tags.push(tag)

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
