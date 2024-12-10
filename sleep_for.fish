function sleep_for --description 'Sleep a given number of hours' -a n
  airplane &
  test -n "$n" || set n 7
  fill 0 126 61
  keycolor (getcolor random sleep_colors) 64
  if [ "$n" -gt 0 ]
    set pth (/usr/bin/pwd)
    cd (assets)'/music/'
    nohup nice -n 19 vlc --no-random --no-loop --qt-start-minimized --play-and-exit $n'h_sleep.xspf' >/dev/null 2>/dev/null &
    disown "$last_pid"
    cd "$pth"
  else
    set n (math "-$n")
    timeout (math "3600*$n") play -q -n synth pinknoise >/dev/null 2>/dev/null &
    disown "$last_pid"
  end
  xrandr --output eDP-1 --brightness '0.25'
  xset dpms force off
  set s (math "3600*$n - 1500")
  nohup fish -c "sleep $s; wakeup "(tty)' '(tput lines)' '(tput cols) 2>/dev/null &
  disown "$last_pid"
end
