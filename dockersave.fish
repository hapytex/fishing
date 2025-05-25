function dockersave --description 'save a docker image as a compressed tarball' -a name
  set nms (string split ':' -m 1 "$name")
  set target "$nms[1]"
  echo -en "\033]0;🐳 dockersave $name\7"
  set sz (docker image inspect -f '{{ .Size }}' "$name")
  docker save "$name" | pv -s "$sz" | gzip > "$target.tar.gz"
  chmod a-w "$target.tar.gz"
end
