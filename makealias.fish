function makealias --description 'make an alias file' -a origin -a new
  if [ ! -f "$origin.fish" ]
    echo >&2 'source file does not exists'
     return 1
  else if [ -f "$new.fish" ]
    echo >&2 'target file already exists'
    return 2
  end
  echo """function $new --description 'alias for $origin'
  $origin \$argv
end""" > "$new.fish"
  git add "$new.fish"
end
