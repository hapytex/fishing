# Defined in - @ line 1
function stackt --wraps='stack test' --description 'alias stackt stack test'
  ulimit -Sv 3000000
  stack test '--test-arguments=--color' $argv 2>&1 | less -r;
  ulimit 1>/dev/null
end
