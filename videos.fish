function videos --description 'see random videos'
  set exts (cat (assets)/movie_extensions)
  nohup vlc --rate 1.3 -Z **/*$exts >/dev/null 2>/dev/null &
  disown "$last_pid"
end
