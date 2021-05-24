# Defined in - @ line 1
function gitmaster --wraps='git stash; git checkout master' --description 'alias gitmaster git stash; git checkout master'
  git stash;
  git checkout master $argv;
end
