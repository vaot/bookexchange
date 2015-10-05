app = angular.module 'bookexchange'

app.service 'UserService', [
  '$rootScope'
  (
    $rootScope
  ) ->

    api = {}

    currentUserMixin =
      actions: ['delete', 'edit']

      ownsBook: (book) ->
        book and book.user_id is @id

      can: (action, book) ->
        action in @actions and @logged_in and @ownsBook(book)

    currentUser = ->
      if @_currentUser?
        @_currentUser
      else
        _currentUser  = Utils.parseJson($rootScope.serverData)
        @_currentUser = angular.extend(_currentUser, currentUserMixin)

    api.currentUser = (property) ->
      if property?
        currentUser()[property]
      else
        currentUser()

    api

]
