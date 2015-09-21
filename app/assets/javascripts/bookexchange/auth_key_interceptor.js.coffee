app = angular.module 'bookexchange'

app.factory 'AuthKeyInterceptor', [
  'UserService'
  (UserService) ->
    request: (config) ->
      headers =
        'X-BookExchange-Auth-key': UserService.currentUser().auth_key

      angular.extend(config.headers, headers)
      config
]
