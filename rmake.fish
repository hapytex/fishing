function rmake --wraps='git pull' --description 'walk up the filetree until it finds a Makefile'
  set cur (pwd)
  set pre ''
  while [ ! -f 'Makefile' ]
    set pre (basename (pwd))"/$pre"
    cd '..'
  end
  wrapampel make "$pre"$argv
  cd "$cur"
end
