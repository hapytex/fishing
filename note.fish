function note --description 'Add a notebook entry'
  if set -q argv[1]
    set nt (echo $argv)
  else
    set nt (read -P (date '+%H%M> '))
  end
  if [ -n "$nt" ]
    measurelog notebook "$nt"
  else
    return 1
  end
end
