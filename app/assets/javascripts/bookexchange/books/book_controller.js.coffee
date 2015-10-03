app = angular.module "bookexchange"

app.controller "BookController", [
  '$scope'
  'bookResource'
  'BookService'
  '$state'
  '$upload'
  'UserService'
  '$http'
  'GoogleSearch'
  (
    $scope,
    bookResource,
    BookService,
    $state,
    $upload,
    UserService,
    $http,
    GoogleSearch
  ) ->

    $scope.book = if bookResource.book then bookResource.book else {}
    $scope.isbnLookUp ?= {}

    $scope.searchBookByIsbn = (isbn) ->
      GoogleSearch.by_isbn(isbn).then (result) ->
        $scope.isbnLookUp.results = result.data.items

    $scope.setBookDetails = (bookDetails) ->
      BookService.copyFromGoogle($scope, bookDetails)
      $scope.isbnLookUp.done = true

    $scope.create = ->
      BookService.save(angular.extend($scope.book, {
        user_id: UserService.currentUser().id
      })).$promise.then (data) ->
        $state.go('books.index')

    $scope.update = ->
      BookService.update($scope.book).$promise.then (data) ->
        $state.go('books.index')

    $scope.$watch 'files', ->
      $scope.upload($scope.files)

    $scope.addTag = (tag, book = null) ->
      book = if book then book else $scope.book
      book.tags ?= []

      if book.tags.indexOf(tag) is -1
        book.tags.push(tag)

    $scope.upload = (files) ->
      if files && files.length
        for file in files
          $upload.upload({
              url: '/api/v1/medias',
              file: file
              fileFormDataName: 'attachment'
          }).progress((evt)->
              progressPercentage = parseInt(100.0 * evt.loaded / evt.total)
              console.log('progress: ' + progressPercentage)
          ).success((data, status, headers, config) ->
            $scope.book.book_cover =
              id: data.id
          )
]
