function sleep_for --description 'Sleep a given number of hours' -a n
  function cleanup -a gamma
    test -n "$gamma" && kill "$gamma"
    xrandr --output eDP-1 --brightness '1'
  end
  airplane &
  killall element-deskop thunderbird >/dev/null 2>/dev/null &
  set banners (gsettings get org.gnome.desktop.notifications show-banners)
  gsettings set org.gnome.desktop.notifications show-banners false
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
    timeout (math "3600*$n") play -q -n synth pinknoise vol 0.0125 &
    set -f gamma $last_pid
  end
  trap "cleanup $gamma" EXIT SIGINT
  set nn (math "$n+1")
  set end (date '+%Y-%m-%d %H:%M:%S%z' -d "+$nn hours")
  gh_status 'Sleeping' 'sleeping' "$end" true
  echo "$end" > "$HOME/block_sleep"
  xrandr --output eDP-1 --brightness '0.25'
  xset dpms force off
  set eps (math "6*$n-3")
  for f in (seq "$eps")
    sleep 600
    keycolor (getcolor random sleep_colors) 32
    xset dpms force off
  end
  sleep 300
  gsettings set org.gnome.desktop.notifications show-banners "$banners"
  wakeup (tty) (tput lines) (tput cols)
end
