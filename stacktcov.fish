# Defined in - @ line 1
function stacktcov --wraps='stack test --coverage' --description 'alias stacktcov stack test'
  stack test '--test-arguments=--color' '--coverage' $argv 2>&1 | less -r;
end
