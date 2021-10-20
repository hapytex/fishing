# Defined in - @ line 1
function stackt --wraps='stack test' --description 'alias stackt stack test'
  set mem (ulimit -Sv)
  ulimit -Sv 500000
  stack test '--test-arguments=--color' $argv 2>&1 | less -r;
  ulimit -Sv "$mem"
end
