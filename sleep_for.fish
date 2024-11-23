function sleep_for --description 'Sleep a given number of hours' -a n
  test -n "$n" || set n 7
  set s (math "3600*$n")
  fill 0 126 61
  set pth (/usr/bin/pwd)
  cd "$fish_function_path[1]/assets/music/"
  nohup nice -n 19 vlc --no-random --no-loop --qt-start-minimized --play-and-exit $n'h_sleep.xspf' >/dev/null 2>/dev/null &
  disown "$last_pid"
  cd "$pth"
  nohup fish -c "sleep $s; fill 255 219 100 | tee /dev/pts/?" >/dev/null 2>/dev/null &
  disown "$last_pid"
end
