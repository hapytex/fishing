# Defined in - @ line 1
function stackt --wraps='stack test' --description 'alias stackt stack test'
  stack test '--test-arguments=--color' $argv | less -r;
end
