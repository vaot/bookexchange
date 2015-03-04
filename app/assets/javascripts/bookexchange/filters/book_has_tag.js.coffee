app = angular.module "bookexchange"

app.filter 'bookHasTag', ->
  (books, predicate) ->
    if predicate is 'all'
      return books

    (book for book in books when predicate in book.tag_list)

