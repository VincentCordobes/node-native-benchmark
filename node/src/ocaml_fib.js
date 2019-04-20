function ocamlFib(n) {
  require('child_process').spawnSync(
    '../../ocaml/_build/default/fib.exe',
    [n],
    {
      // stdio: 'inherit',
    },
  );
}

module.exports = { ocamlFib };
