function blackcp --description 'run the Black formatter, and if Black made changes, commit and push these'
  if set -q argv[1]
    set args $argv
  else
    set args .
  end
  if ! black --check --quiet $args
    black $args
    gitcp 'ℬ𝓁𝒶𝒸𝓀 reformatting'
  end
end
