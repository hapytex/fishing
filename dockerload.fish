function dockerload --description 'load a docker image from a compressed tarball'
  set i 1
  set n (count $argv)
  for name in $argv
    echo -en "\033]0;🐳 $i/$n load $name\7"
    pv "$name" | gunzip -c | docker image load
    set i (math "$i+1")
  end
end
