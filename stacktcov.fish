# Defined in - @ line 1
function stacktcov --wraps='stack test --coverage' --description 'alias stacktcov stack test'
  set mem (ulimit -Sv)
  ulimit -Sv 6000000
  stack test '--test-arguments=--color' '--coverage' $argv 2>&1 | less -r;
  ulimit -Sv "$mem"
end
