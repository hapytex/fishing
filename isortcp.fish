function isortcp --description 'run the isort formatter, and if isort made changes, commit and push these'
  if set -q argv[1]
    set args $argv
  else
    set args .
  end
  if ! isort --check --quiet $args
    isort $args
    gitcp 'isort reformatting'
  end
end
