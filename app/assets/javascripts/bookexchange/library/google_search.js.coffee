app = angular.module "bookexchange"

app.service "GoogleSearch", [
  "$http"
  ($http) ->

    external_call = (query) ->
      $http.get("https://www.googleapis.com/books/v1/volumes?q=#{query}")

    api = {}

    api.by_isbn = (query) ->
      external_call("isbn:#{query}")

    api.by_title = (query) ->
      external_call("intitle:#{query}")

    api.by_author = (query) ->
      external_call("inauthor:#{query}")

    api.by_subject = (query) ->
      external_call("subject:#{query}")

    api

]
