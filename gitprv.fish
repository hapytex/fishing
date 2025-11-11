function gitprv --wraps='gh pr view'  --description 'show comments of the active pull request'
  gh pr view $argv
end
