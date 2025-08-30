function blackcp --description 'run the Black formatter, and if Black made changes, commit and push these'
  if set -q argv[1]
    set args . $argv
  else
    set args $argv
  fi
  if ! black --check --quiet $args
    black $argv
    gitcp 'black reformatting'
  end
end
