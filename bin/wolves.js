#!/usr/bin/env node
process.title = 'wolves';
var werewolf = require('../dist/main');
var server = require('../dist/server');
var argv = require('optimist').argv;
var args = [argv._[0], argv];
server.apply(werewolf, args);
