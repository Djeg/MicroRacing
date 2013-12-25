var rmdir = require('rimraf')
  , fs    = require('fs')
;

module.exports = function(grunt) {

  // project configuration
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      options: {
        banner: '/*! David Jegat <david.jegat@gmail.com> <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n',
        compress: {
          global_defs: {
            "DEBUG": false
          },
          dead_code: true
        },
        expand: false,
        report: 'min',
        mangle: true
      },
      all: {
        files: {
          'dist/app.js': ['lib/**/*.js', 'compiled/**/**.js']
        }
      }
    },
    coffee: {
      compiled: {
        expand: true,
        flattern: true,
        cwd: 'src',
        src: ['**/*.coffee'],
        dest: 'compiled',
        ext: '.js'
      }
    },
    bower: {
      install: {
        options: {
          cleanup: true,
          targetDir: './lib'
        }
      }
    },
    watch: {
      src: {
        files: ['src/**/*.coffee', 'lib/**/*.js'],
        tasks: ['compiled']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-bower-task');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // clean up compiled and dist directory task
  grunt.registerTask('cleanup', 'Cleanup dist and compiled directories', function() {
    if (fs.existsSync('./compiled')) {
      rmdir('./compiled', function(error) {
        console.log('No directory ./compiled');
      });
    }
    if (fs.existsSync('./dist')) {
      rmdir('./dist', function(error) {
        console.log('No directory ./dist');
      });
    }
  });

  grunt.registerTask('install', ['bower:install']);
  grunt.registerTask('compiled', ['cleanup', 'coffee', 'uglify:all']);
  grunt.registerTask('default', ['install', 'compiled']);
}
