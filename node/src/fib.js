#!/usr/bin/env node

const fibM = (() => {
  const table = new Map();
  const f = n => {
    // const e = table.get(n);
    // if (e) return e;

    if (n === 0) return 0;
    if (n === 1) return 1;

    const result = f(n - 1) + f(n - 2);
    // table[n] = result;
    return result;
  };
  return f;
})();

function fib(n) {
  if (n === 0) return 0;
  if (n === 1) return 1;

  return fib(n - 1) + fib(n - 2);
}

// let iteration_count = 200;
// let time = 0;
// for (let i = 0; i < iteration_count; i++) {
//   let start = process.hrtime();
fibM(38);
//   time += process.hrtime(start)[1] / 1000;
// }
// const total = time / iteration_count;
// console.log(total + 'ms');

module.exports = {
  fibM,
  fib,
};
