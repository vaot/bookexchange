app = angular.module "bookexchange"

app.filter 'timeElapsed', ->
  (timeString) ->
    jsTime = new Date Date.parse(timeString)

    # Strip miliseconds
    difference = (new Date() - jsTime)/1000

    # get seconds
    seconds = Math.round(difference % 60);

    # remove seconds from the date
    difference = Math.floor(difference / 60);

    # get minutes
    minutes = Math.round(difference % 60);

    # remove minutes from the date
    difference = Math.floor(difference / 60);

    # get hours
    hours = Math.round(difference % 24);

    # remove hours from the date
    difference = Math.floor(difference / 24);

    # the rest of timeDiff is number of days
    days = difference

    result = ""
    result += "#{days} days ago" if days > 0
    result += " #{hours} hours ago" if hours > 0
    result += " #{minutes} mins ago" if hours > 0
