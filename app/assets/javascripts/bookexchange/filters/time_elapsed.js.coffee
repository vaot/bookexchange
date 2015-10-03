app = angular.module 'bookexchange'

app.filter 'timeElapsed', ->
  (string) ->
    time = new Date Date.parse(string)

    # Strip miliseconds
    difference = (new Date() - time) / 1000

    # get seconds
    seconds = Math.round(difference % 60)

    # remove seconds from the date
    difference = Math.floor(difference / 60)

    # get minutes
    minutes = Math.round(difference % 60)

    # remove minutes from the date
    difference = Math.floor(difference / 60)

    # get hours
    hours = Math.round(difference % 24)

    # remove hours from the date
    difference = Math.floor(difference / 24)

    # the rest of timeDiff is number of days
    days = difference

    result  = ""
    result += "#{days} days" if days > 0
    result += " #{hours} hours" if hours > 0
    result += " #{minutes} mins" if hours > 0
    result += " ago" if result.present?
