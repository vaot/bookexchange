app = angular.module 'bookexchange'

app.service 'BooksService', [
  'BooksResource'
  (
    BooksResource
  ) ->
    api = {}

    api.save = (params = {}) ->
      NProgress.start()
      BooksResource.save(params).$promise.then (response) ->
        NProgress.done()
        response

    api.update = (params = {}) ->
      BooksResource.update(params).$promise

    api.query = (params = {}) ->
      BooksResource.query(params).$promise

    api.delete = (bookId) ->
      BooksResource.delete(bookId).$promise

    api

]
