function sleep_for --description 'Sleep a given number of hours' -a n
  test -n "$n" || set n 7
  fill 0 126 61
  keycolor 100 75 0 25
  if [ "$n" -gt 0 ]
    set pth (/usr/bin/pwd)
    cd "$fish_function_path[1]/assets/music/"
    nohup nice -n 19 vlc --no-random --no-loop --qt-start-minimized --play-and-exit $n'h_sleep.xspf' >/dev/null 2>/dev/null &
    disown "$last_pid"
    cd "$pth"
  else
    set n (math "-$n")
    timeout (math "3600*$n") play -q -n synth pinknoise >/dev/null 2>/dev/null &
    disown "$last_pid"
  end
  xset dpms force off
  set s (math "3600*$n")
  nohup fish -c "sleep $s; xset dpms force on; keycolor 255 219 100 255; fill 255 219 100 | tee "(tty) >/dev/null 2>/dev/null &
  disown "$last_pid"
end
