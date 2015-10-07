app = angular.module 'bookexchange'

app.service 'UserService', [
  'ServerData'
  (
    ServerData
  ) ->

    api = {}

    currentUserMixin =
      actions: ['delete', 'edit']

      loggedIn: ->
        @id?

      ownsBook: (book) ->
        book and book.user_id is @id

      can: (action, book) ->
        action in @actions and @loggedIn() and @ownsBook(book)

    currentUser = ->
      if @_currentUser?
        @_currentUser
      else
        _currentUser  = ServerData.get('current_user')
        @_currentUser = angular.extend(_currentUser ? {}, currentUserMixin)

    api.currentUser = (property) ->
      if property?
        currentUser()[property]
      else
        currentUser()

    api

]
