function gitb --wraps='git checkout -b' --description 'make a new git branch'
  git checkout -b $argv
end
