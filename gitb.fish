function gitb --wraps='git checkout -b' --description 'make a new git branch'
  if set -q argv[1]
    git checkout -b $argv
  else
    git branch
  end
end
