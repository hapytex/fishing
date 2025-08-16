function gitacp --wraps='git add' --description 'add items to the repository, commit, and push'
  git add $argv
  set vals (string join ' ' $argv)
  git commit -m "add $vals"
  gitp
end
