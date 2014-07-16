#!/usr/bin/env node
process.title = 'ayazaga'
require('coffee-script/register');
var grunt = require('grunt');
var ayazaga = require('../Gruntfile.coffee')(grunt);
grunt.tasks(process.argv.slice(2));
