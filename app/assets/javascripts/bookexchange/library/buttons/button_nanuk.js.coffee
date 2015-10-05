app = angular.module 'bookexchange'

app.directive 'buttonNanuk', [
  ->
    replace: true
    transclude: true
    template: (element, attrs) ->
      template = '<div class="button-nanuk">'
      for part in attrs.buttonNanuk.split('')
        part = '&nbsp;' if part.trim().length is 0
        template += "<span>#{part}</span>"
      template += '<div ng-transclude-replace></div></div>'
      template
]
