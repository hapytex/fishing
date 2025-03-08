function makealias --description 'make an alias file' -a origin -a new
  echo """function $new --description 'alias for $origin'
  $origin \$argv
end""" > "$new.fish"
  git add "$new.fish"
end
