# Defined in - @ line 1
function stackb --wraps=stack\ build\ --force-dirty\ --ghc-options=\'-Wall\' --description alias\ stackb\ stack\ build\ --force-dirty\ --ghc-options=\'-Wall\'
  set mem (ulimit -Sv)
  ulimit -Sv 500000
  stack build --force-dirty --ghc-options='-Wall -fdiagnostics-color=always' $argv 2>&1 | less -r;
  ulimit -Sv "$mem"
end
