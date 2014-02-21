###
The only requirement of Gruntfile is that it exports a function that accepts
the grunt object. In the body of this function, we will do the following:
  1. load our dependencies
  2. configure our plugins
  3. define our top-level tasks
###
module.exports = (grunt) ->
  # a simple way to load all the grunt plugins we have installed
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  ###
  the main entry point for grunt: a massive object with configuration options
  for all of our grunt plugins.
  ###
  grunt.initConfig
    # <task>:
    #   <target>:
    #     files: [{
    #       expand: true
    #       cwd: 'src'
    #       src: '{,*/}*.coffee'
    #       dest: '.tmp'
    #       ext: '.js'
    #     }, 'test/src/**/*.coffee']
    #     options: {}
    # ...

  ###
  compose our top-level tasks from our individual plugins.
  grunt.registerTask 'name', 'description', ['task', 'task:target', ...]
  ###
  grunt.registerTask 'serve', 'compile and serve files for development', []
  grunt.registerTask 'build', 'compile source files for production', []
  grunt.registerTask 'test', 'run unit tests', []

  # what to do when you just run 'grunt' with no task name
  grunt.registerTask 'default', ['build', 'test']