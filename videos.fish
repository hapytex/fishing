function videos --description 'see random videos'
  nohup vlc --rate 1.3 -Z **/*.mp4 **/*.avi **/*.mkv >/dev/null 2>/dev/null &
end
