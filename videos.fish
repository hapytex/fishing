function videos --description 'see random videos'
  nohup nice -n 19 vlc --rate 1.3 -Z **/*.mp4 **/*.avi **/*.mkv >/dev/null 2>/dev/null &
end
