function blackcp --description 'run the Black formatter, and if Black made changes, commit and push these'
  if ! black --check --quiet $argv
    black $argv
    gitcp 'black reformatting'
  end
end
