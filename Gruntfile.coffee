module.exports = (grunt)->

  require('load-grunt-tasks') grunt

  grunt.initConfig
    po2json:
      options:
        format: 'jed'

      all:
        src: ['i18n/gettext/**/*.po'],
        dest: 'dist/i18n/'

    jasmine_node:
      options:
        projectRoot: 'src'
        extensions: 'coffee'
        coffee: yes
        includeStackTrace: no
      all: ['spec/']

    coffee:
      world:
        options:
          join: yes
          bare: yes
        files:
          'dist/main.js': [
            'src/world/resources.coffee'
            'src/world/world.coffee'
            'src/world/human.coffee'
            'src/world/stranger.coffee'
            'src/world/village/villager.coffee'
            'src/world/village/*.villager.coffee'
            'src/world/square.coffee'
          ],
      server:
        files:
          'dist/server.js': [
            'src/server.coffee'
          ]

    uglify:
      world: files: 'dist/main.js': 'dist/main.js'
      server: files: 'dist/server.js': 'dist/server.js'

  grunt.registerTask 'build', ['coffee', 'uglify']

  grunt.registerTask 'test', ['jasmine_node']

  grunt.registerTask 'servebot', ->
    console.log 3

  grunt.registerTask 'default', ['build']
