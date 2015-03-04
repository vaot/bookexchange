app = angular.module "bookexchange"

app.controller "BookController", [
  '$scope'
  'bookResource'
  'BookService'
  '$state'
  '$upload'
  ($scope, bookResource, BookService, $state, $upload) ->
    $scope.book = bookResource.book

    $scope.create = ->
      BookService.save($scope.book).$promise.then (data) ->
        $scope.books.push data.book
        $state.go('books.index')

    $scope.$watch 'files', ->
      $scope.upload($scope.files)

    $scope.upload = (files) ->
      if files && files.length
        for file in files
          $upload.upload({
              url: '/api/v1/medias',
              file: file
              fileFormDataName: 'attachment'
          }).progress((evt)->
              progressPercentage = parseInt(100.0 * evt.loaded / evt.total)
              console.log('progress: ' + progressPercentage + '% ' + evt.config.file.name)
          ).success((data, status, headers, config) ->
            $scope.book.book_cover =
              id: data.id
          )
]
