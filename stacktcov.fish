# Defined in - @ line 1
function stacktcov --wraps='stack test --coverage' --description 'alias stacktcov stack test'
  ulimit -Sv 3000000
  stack test '--test-arguments=--color' '--coverage' $argv 2>&1 | less -r;
  ulimit 1>/dev/null
end
