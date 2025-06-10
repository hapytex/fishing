function dockersavescp --description 'save a docker image as a compressed tarball and copy it with scp' -a host
  set i 1
  set n (count $argv[2..])
    echo "$name"
  for name in $argv[2..]
    set nms (string split ':' -m 1 "$name")
    set target "$nms[1]"
    echo -en "\033]0;🐳 $i/$n dockersave $name\7"
    set sz (docker image inspect -f '{{ .Size }}' "$name")
    docker save "$name" | pv -s "$sz" | gzip > "$target.tar.gz"
    if [ "$i" -lt "$n" ]
      scp "$target.tar.gz" "$host/$target.tar.gz" &
    else
      scp "$target.tar.gz" "$host/$target.tar.gz"
    chmod a-w "$target.tar.gz"
    set i (math "$i+1")
  end
  wait
end
