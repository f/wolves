module.exports = (grunt)->

  require('load-grunt-tasks') grunt

  grunt.initConfig
    po2json:
      options:
        format: 'jed'

    all:
      src: ['i18n/gettext/**/*.po'],
      dest: '.build/i18n/'

  grunt.registerTask 'test', ->
    console.log 2

  grunt.registerTask 'servebot', ->
    console.log 3

  grunt.registerTask 'default', ->
    console.log 1
