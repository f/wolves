#!/usr/bin/env node
process.title = 'wolves';
var Wolves = require('../dist/main');
var server = require('../dist/server');
var argv = require('optimist').argv;
var args = [argv._[0], argv];
server.apply(Wolves, args);
