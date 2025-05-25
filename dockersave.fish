function dockersave --description 'save a docker image as a compressed tarball' -a name
  set nms (string split ':' -m 1 "$name")
  set target "$nms[1]"
  docker save "$name" | gzip > "$target.tar.gz"
  chmod a-w "$target.tar.gz"
end
