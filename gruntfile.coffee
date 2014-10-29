module.exports = (grunt)->
  grunt.initConfig {

    pkg: grunt.file.readJSON 'package.json'

    watch:
    #watch coffee files for changes and launch coffeescript compilation on change
      coffee:
        files: ['src/coffee/*.coffee', 'src/coffee/**/*.coffee']
        tasks: ['coffee:compileModuleDefinitions', 'coffee:compileModules']


    #watch less files for changes and launch less compilation on change
      less:
        files: ['src/less/*.less', 'src/less/**/*.less']
        tasks: ['less:compile']


    coffee:
      compileModuleDefinitions:
        join: true
        files:
          'build/js/<%= pkg.name %>.definitions.min.js': [
            'src/coffee/*.module.coffee',
            'src/coffee/**/*.module.coffee'
          ]

      compileModules:
        join: true
        files:
          'build/js/<%= pkg.name %>.modules.min.js': [
            'src/coffee/*.coffee',
            'src/coffee/**/*.coffee',
            '!src/coffee/*.module.coffee',
            '!src/coffee/**/*.module.coffee'
          ]

    less:
      compile:
        files:
          'build/css/<%= pkg.name %>.css': 'src/less/<%= pkg.name %>.less'

  }


  #load tasks from node_modules
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-less'

  #watch as default task
  grunt.registerTask 'default', ['watch']
