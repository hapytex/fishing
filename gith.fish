function gith --wraps='git checkout' --description 'checkout a given branch'
  git stash
  git checkout $argv
end
