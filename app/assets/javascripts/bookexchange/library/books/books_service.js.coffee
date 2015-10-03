app = angular.module 'bookexchange'

app.service 'BooksService', [
  'BooksResource'
  (
    BooksResource
  ) ->
    api = {}

    api.save = (params = {}) ->
      BooksResource.save(params).$promise

    api.update = (params = {}) ->
      BooksResource.update(params).$promise

    api.query = (params = {}) ->
      BooksResource.query(params).$promise

    api

]
