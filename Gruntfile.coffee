module.exports = (grunt)->

  require('load-grunt-tasks') grunt

  grunt.initConfig
    po2json:
      options:
        format: 'jed'

      all:
        src: ['i18n/gettext/**/*.po'],
        dest: '.build/i18n/'

    jasmine_node:
      options:
        projectRoot: 'src'
        extensions: 'coffee'
        coffee: yes
        includeStackTrace: no
      all: ['spec/']

    coffee:
      all:
        options:
          bare: yes
        files:
          '.build/main.js': [
            'src/world/resources.coffee'
            'src/world/world.coffee'
            'src/world/human.coffee'
            'src/world/stranger.coffee'
            'src/world/village/villager.coffee'
            'src/world/village/*.villager.coffee'
            'src/world/square.coffee'
          ]

    uglify: all: files: '.build/main.js': '.build/main.js'

  grunt.registerTask 'build', ['coffee', 'uglify']

  grunt.registerTask 'test', ['jasmine_node']

  grunt.registerTask 'servebot', ->
    console.log 3

  grunt.registerTask 'default', ['build']
