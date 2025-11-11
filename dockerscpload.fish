function dockerscpload --description 'transfer docker images over ssh to a remote directly loading these in docker at the remote side' -a host
  set i 1
  set n (count $argv[2..])
    echo "$name"
  for name in $argv[2..]
    set nms (string split ':' -m 1 "$name")
    set target "$nms[1]"
    echo -en "\033]0;🐳 $i/$n dockersave $name\7"
    set sz (docker image inspect -f '{{ .Size }}' "$name")
    if [ -n "$host" ]
      docker save "$name" | pv -s "$sz" | gzip | ssh "$host" "gzip -d | docker image load"
    else
      docker save "$name" | pv -s "$sz" > "$target.tar.gz"
    end
    set i (math "$i+1")
  end
  wait
end
