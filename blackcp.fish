function blackcp --description 'run the Black formatter, and if Black made changes, commit and push these'
  if ! black $argv
    gitcp 'black'
  end
end
