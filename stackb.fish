# Defined in - @ line 1
function stackb --wraps=stack\ build\ --force-dirty\ --ghc-options=\'-Wall\' --description alias\ stackb\ stack\ build\ --force-dirty\ --ghc-options=\'-Wall\'
  stack build --force-dirty --ghc-options='-Wall' $argv;
end
