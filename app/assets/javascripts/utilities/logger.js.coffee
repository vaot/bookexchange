window.Utils ?= {}

Utils.log = (severity, args...) ->
  if severity in ['log', 'info', 'warning', 'error']
    console[severity](args...)
  else
    @log("Unkown severity: #{severity}")
