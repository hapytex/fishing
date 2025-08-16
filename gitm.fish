function gitm --wraps='git mv' --description 'move a given file in a git repository'
  git mv $argv;
end
