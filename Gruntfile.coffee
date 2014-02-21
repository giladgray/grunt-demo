module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig
    ###
    <task>:
      <target>:
        files: [{
          expand: true
          cwd: 'src'
          src: '{,*/}*.coffee'
          dest: '.tmp'
          ext: '.js'
        }, 'test/src/**/*.coffee']
        options: {}
    ...
    ###

  grunt.registerTask 'build', 'compile source files', ['clean:dist', ...]
  grunt.registerTask 'test', 'run tests', ['build', 'mocha']

  grunt.registerTask 'default', ['test']