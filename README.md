Phantomjs Console
===================

Control a headless browser console right from your terminal

[![Phantom Console Screencast](https://dl.dropbox.com/u/732913/phantom-console-screencast.png)](http://cloud.github.com/downloads/gr2m/phantomjs-console/phantom-console-screencast.mov)

Dependencies
--------------

[PhantomJS](https://github.com/ariya/phantomjs), the headless browser

got [brew](https://github.com/mxcl/homebrew)? lucky you:

```
$ brew update && brew install phantomjs
```

other systems: [it's simple, too](http://phantomjs.org/download.html)


1, 2 ... done
---------------

```
$ cake -l http://google.com console

Put your commands in the following file:
$EDITOR .command.js

Exit with ^ + C

 > console.log(location)
http://www.google.de/
```


Usage
-------

```
# open command file
$ $EDITOR .command.js 

# start console
phantomjs phantomjs_console.coffee http://google.com
```

You can also use [cake](http://jashkenas.github.com/coffee-script/documentation/docs/cake.html) to open the command file and to start the console. This will let you run coffeescript commands.

```
$ cake -l http://google.com console
```

Every time you hit save in your editor, the command will be executed within the scope of the passed location (a url or a local path)



How does it work?
-------------------

PhantomJS executes `phantomjs_console.coffee`, wich is continuously watching for changes of the `.command.js` file. When ever a change appears, it loads and deletes its contents and executes it as command within the scope of the passed location.

That's it. Feedback most welcome