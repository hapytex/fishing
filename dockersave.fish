function dockersave --description 'save a docker image as a compressed tarball'
  set i 1
  set n (count $argv)
  for name in $argv
    set nms (string split ':' -m 1 "$name")
    set target "$nms[1]"
    echo -en "\033]0;🐳 $i/$n dockersave $name\7"
    set sz (docker image inspect -f '{{ .Size }}' "$name")
    docker save "$name" | pv -s "$sz" | gzip > "$target.tar.gz"
    chmod a-w "$target.tar.gz"
    set i (math "$i+1")
  end
end
