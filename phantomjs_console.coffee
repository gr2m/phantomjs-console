fs           = require('fs')
command_file = ".command.js"

# make sure tthe command_file does exist
fs.touch command_file

# return unless a location has been passed
location = phantom.args[0]
unless location
  console.log "\nUSAGE:"
  console.log "phantomjs path/to/file.html\n"
  phantom.exit()


# help
console.log ""
console.log "Put your commands in the following file:"
console.log "$EDITOR #{command_file}"
console.log ""
console.log "Exit with ^ + C"
console.log ""

page = new WebPage()

page.onConsoleMessage = (msg, line, file)-> 
  console.log msg
  
page.onError = (msg, trace) ->
  console.log msg

page.open location, (status) ->
  readCommand = ->
    command = fs.read(command_file)
    fs.write command_file, ''

    # strip the comment on first line
    command = command.replace /^.*\n/, ''

    # strip whitespaces
    command = command.replace /(^\s+|\s+$)/g, ''

    if command

      console.log " > #{command}"
      page.evaluate execCommand, command

  execCommand = (command) ->

    ret = eval(command)
    console.log "->", ret?.toString().replace(/\n/g, "\n   ") unless /console\.log/.test command


  if status isnt 'success'
    console.log status + '! Unable to access ' + location
    phantom.exit()
  else
    page.evaluate ->
      console.log "#{location} loaded."
    setInterval readCommand, 100