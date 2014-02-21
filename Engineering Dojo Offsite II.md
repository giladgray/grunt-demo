# British History 101: pastoral web development with Yeoman and Grunt

## What will we do?
* setup a text-editor-and-command-line workflow for frontend web development
* write as much CoffeeScript, Sass, and Handlebars as we want
* compile it down to a handful of .js, .css, and .html files
* construct an asset pipeline with image optimization
* throw our shit up live on the internet

## My First Tutorial
beginner:
- create Gruntfile.coffee
- coffee, sass, autoprefixer, jquery
- build, open, watch
- imagemin
intermediate:
- bootstrap, font-awesome
- third-party libraries through bower and build:js
advanced:
- require.js, backbone, handlebars
- yo scaffolding
- full optimization: *min, rev
- parse.com

## Step 1: Grunt.
Let’s see what Grunt is all about.

In your project directory, run the following commands
1. `npm install -g grunt-cli` to globally install the Grunt CLI tool
2. `npm install --save-dev grunt matchdep` to install and save Grunt and matchdep (for fast dependency loading)
3. create `Gruntfile.js` or `Gruntfile.coffee`, depending on your preferred language (I’ll be using CoffeeScript throughout this demo because the syntax is much shorter). An example starter Gruntfile can be [found here](https://github.com/giladgray/grunt-demo/blob/eed22fbfb3e52f8fa36c1f122c6ce3f218e19c26/Gruntfile.coffee)
3. install and save a few [Grunt plugins](http://gruntjs.com/plugins): `npm install --save-dev <plugin>` (nearly 2300 registered!!)

### A Simple Beginner Workflow
1. `git clone https://github.com/giladgray/grunt-demo.git`
2. `npm install`
3. `cd grunt-demo/beginner`
4. `grunt`
Look in the **beginner/** folder of my [grunt-demo](https://github.com/giladgray/grunt-demo) project on GitHub.



#### `grunt build`
compile all my files and optimize them for production. give me a single folder with my entire app that I can upload to a host.
```javascript
grunt.registerTask('build', 
    'clean:dist',       // clean output directories
    'useminPrepare',    // ??
    'concurrent:dist',  // compile all assets for prod in parallel
    'autoprefixer',     // run our CSS through the autoprefixer (yeah!)
    'requirejs',        // optimize our requirejs app
    'concat',           // concatenate all output files
    'cssmin',           // minify css
    'uglify', 	        // minify js
    'modernizr',        // ??
    'copy:dist',        // copy static assets
    'rev',              // revision-ize all our files
    'usemin'            // update links to use minified files
]);
```

#### `grunt server`
run the dev server and recompile my files whenever they change. oh and reload the page for me too.
```javascript
grunt.registerTask('server', function (target) {
    if (target === 'dist') {
        return grunt.task.run(['build', 'open', 'connect:dist:keepalive']);
    }

    grunt.task.run([
        'clean:server',       // clean temp directories
        'concurrent:server',  // compile all files in dev mode
        'autoprefixer',       // run css through autoprefixer
        'connect:livereload', // launch the dev server with livereload
        'open',               // open the browser
        'watch'               // watch files for changes and update as necessary
    ]);
});
```

## Step 2: Bower.
Ok so we have a basic app with a build system. Time to install some libraries and really get rocking

## Step 3: Yeoman.
Ok get ready, this is going to happen really fast.
Yeoman is a workflow for modern webapps. It consists of three pieces:

1. [yo](http://yeoman.io), the web’s scaffolding tool. we’ll use the `yo` command to generate our initial app structure.
2. [grunt](http://gruntjs.com), a javascript task runner. Gruntfile.coffee is our bread and butter because it describes the entire build process. from development server to asset compilation to production mode, grunt will do it all.
3. [bower](http://bower.io/), a package manager for the web. bower is basically npm but all of its packages are designed for use in the browser. I’m sure you could get away with npm if you wanted to, but bower’s, like, *suuuper* trendy.

When we’re done, our workflow will look something like this:
```
# scaffold the project
yo webapp
# install dependencies
bower install --save jquery lodash sass-bootstrap
bower install —-save backbone handlebars
# launch development server
grunt server
# ...write some code...
# build and test
grunt build
# deploy!!
```

0. install [NodeJS](http://nodejs.org/) or `npm update npm -g`
1. `npm install -g yo` to install yeoman, grunt and bower
2. `npm install -g generator-webapp` to install our first `yo` generator.
3. `mkdir project`
4. `cd project`
5. `yo webapp`

We now have a basic app that will compile... 
