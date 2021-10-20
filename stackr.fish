# Defined in - @ line 1
function stackr --wraps='stack run' --description 'alias stackr stack run'
  set mem (ulimit -Sv)
  ulimit -Sv 500000
  stack run $argv;
  ulimit -Sv "$mem"
end
