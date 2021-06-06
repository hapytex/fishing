# Defined in - @ line 1
function gitmaster --wraps='git stash; git checkout master; git pul origin master' --description 'alias gitmaster git stash; git checkout master; git pull origin master'
  git stash;
  git checkout master $argv;
  git pull origin master
end
