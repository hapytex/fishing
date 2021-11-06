# Defined in - @ line 1
function stackd --wraps='stack haddock --force-dirty' --description 'alias stackd stack haddock --force-dirty'
  set mem (ulimit -Sv)
  ulimit -Sv 6000000
  stack haddock --force-dirty $argv;
  ulimit -Sv "$mem"
end
