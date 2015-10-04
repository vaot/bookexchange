app = angular.module 'bookexchange'

app.controller 'BookCategoryController', [
  '$scope'
  (
    $scope
  ) ->
    $scope.categories = [
      { label: 'SFU',     filter: 'sfu' }
      { label: 'Popular', filter: 'popular' }
      { label: 'Recent',  filter: 'recent' }
    ]
]
