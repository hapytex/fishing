# Defined in - @ line 1
function gitc --wraps='git commit -am' --description 'alias gitc git commit -am'
  git commit -am $argv;
end
