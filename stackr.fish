function stackr --wraps='stack run' --description 'alias stackr stack run'
  set mem (ulimit -Sv)
  ulimit -Sv 6000000
  stack run $argv;
  ulimit -Sv "$mem"
end
