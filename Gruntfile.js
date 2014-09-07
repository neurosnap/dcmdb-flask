module.exports = function(grunt) {
    grunt.initConfig({
        "pkg": grunt.file.readJSON("package.json"),
        "concat": {
            "options": {
                "separator": ";"
            },
            "dist": {
                "src": ["apts/**/*.js"],
                "dest": "apts/static/<%= pkg.name %>.js"
            }
        },
        "uglify": {
            "options": {
                "banner": "/*! <%= pkg.name %> <%= grunt.template.today('dd-mm-yyyy') %> */\n"
            },
            "dist": {
                "files": {
                    "apts/static/<%= pkg.name %>.min.js": ["<%= concat.dist.dest %>"]
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-concat');

    grunt.registerTask('default', ['concat', 'uglify']);
};
