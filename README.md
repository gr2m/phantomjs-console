Phantomjs Console
===================

Control a headless browser console right from your terminal


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


Requirements
--------------

[PhantomJS](https://github.com/ariya/phantomjs), the headless browser


How does it work?
-------------------

PhantomJS executes `phantomjs_console.coffee`, wich is continuously watching for changes of the `.command.js` file. When ever a change appears, it loads and deletes its contents and executes it as command within the scope of the passed location.

That's it. Feedback most welcome