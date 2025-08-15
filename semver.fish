function semver --description 'Convert a given requirements file to its sem-ver equivalent'
  set target (mktemp)
  for item in $argv
    fish_home natrix semver.py < "$item" > "$target" && mv "$target" "$item"
  end
end
