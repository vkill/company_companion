###
http://stackoverflow.com/questions/3326650/console-is-undefined-error-for-internet-explorer

Protect window.console method calls, e.g. console is not defined on IE
unless dev tools are open, and IE doesn't define console.debug
###

(->
  window.console = {}  unless window.console
  
  # union of Chrome, FF, IE, and Safari console methods
  m = ["log", "info", "warn", "error", "debug", "trace", "dir", "group", "groupCollapsed", "groupEnd", "time", "timeEnd", "profile", "profileEnd", "dirxml", "assert", "count", "markTimeline", "timeStamp", "clear"]
  
  # define undefined methods as noops to prevent errors
  i = 0

  for method in m
    unless window.console[method]
      window.console[method] = ->
)()
