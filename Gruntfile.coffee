yml = require 'js-yaml'
fs  = require 'fs'
config = yml.load fs.readFileSync './config/config.yml'

module.exports = (grunt)->

  require('load-grunt-tasks') grunt

  grunt.initConfig

    xgettext:
      options:
        functionName: 'translate'
        potFile: 'i18n/messages.pot'
      target:
        files:
          javascript: ['dist/**/*.js']

    po2json:
      options:
        format: 'raw'
        stringOnly: yes

      all:
        src: ['i18n/translations/**/*.po'],
        dest: 'dist/i18n/'

    shell:
      msgmerge:
        command: config.locale.languages.map((locale)->
          po = "i18n/translations/#{locale}.po"
          """
          if [ -f "#{po}" ]; then
            echo "Updating #{po}"
            msgmerge #{po} i18n/messages.pot > #{po}.tmp
            exitCode=$?
            if [ $exitCode -ne 0 ]; then
              echo "Msgmerge failed with exit code $?"
              exit $exitCode
            fi
            mv #{po}.tmp #{po}
          fi

          """).join ''

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

  grunt.registerTask 'i18n', ['xgettext', 'shell:msgmerge', 'po2json']
  grunt.registerTask 'build', ['coffee', 'i18n', 'uglify']

  grunt.registerTask 'test', ['jasmine_node']

  grunt.registerTask 'servebot', ->
    console.log 3

  grunt.registerTask 'default', ['build']
