#!/usr/bin/env node

const Benchmark = require('benchmark');
const { fib, fibM } = require('./fib');
const { ocamlFib } = require('./ocaml_fib');
const fs = require('fs');

const MAX_N = 50;
const FILE_NAME = 'points.dat';

const header = 'n js ocaml\n';
console.log(header);
fs.appendFileSync(FILE_NAME, header);
for (let n = 10; n < MAX_N; n += 2) {
  new Benchmark.Suite()
    .add('JS fibonacci', () => {
      fib(n);
    })
    .add('OCaml fibonacci', () => {
      ocamlFib(n);
    })
    .on('complete', function() {
      const row = n + ' ' + this[0].hz + ' ' + this[1].hz + '\n';
      console.log(row);
      fs.appendFileSync(FILE_NAME, row);
    })
    .run();
}
