app = angular.module 'bookexchange'

app.directive 'ngTranscludeReplace', [
  ->
    terminal: true
    restrict: 'EA'
    link: (scope, element, attr, controller, transclude) ->
      if !transclude
        console.error('Illegal use of ngTranscludeReplace directive in the template!\nNo parent directive that requires a transclusion found.')

      transcludeFn = (clone) ->
        if clone.length
          element.replaceWith(clone)
        else
          element.remove()

      transclude(transcludeFn)
]
