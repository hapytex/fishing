function sleep_for --description 'Sleep a given number of hours' -a n
  test -n "$n" || set n '7'
  function cleanup -a gamma
    test -n "$gamma" && kill "$gamma"
    xrandr --output eDP-1 --brightness '1'
    gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
    xinput -enable 11
    gh_status '' 'alarm_clock' '25 minutes' false
  end
  airplane &
  gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled &
  xinput -disable 11
  # kill noisy apps
  killall element-desktop thunderbird-bin java >/dev/null 2>/dev/null &
  set banners (gsettings get org.gnome.desktop.notifications show-banners)
  gsettings set org.gnome.desktop.notifications show-banners false
  test -n "$n" || set n 7
  fill (getcolor 0 wakeup_colors)
  keycolor (getcolor random sleep_colors) 64
  if [ "$n" -lt 0 ]
    set n (math "-$n")
    set pth (/usr/bin/pwd)
    cd (assets)'/music/'
    nohup nice -n 19 vlc --no-random --no-loop --qt-start-minimized --play-and-exit $n'h_sleep.xspf' >/dev/null 2>/dev/null &
    disown "$last_pid"
    cd "$pth"
  else
    timeout (math "3600*$n") play -q -n synth pinknoise vol 0.0250 fade 5 >/dev/null 2>/dev/null &
    set gamma $last_pid
  end
  trap "cleanup $gamma" EXIT
  set nn (math "$n+1")
  set end (date '+%Y-%m-%d %H:%M:%S%z' -d "+$nn hours")
  gh_status 'Sleeping' 'sleeping' "$end" true
  echo "$end" > "$HOME/block_sleep"
  xrandr --output eDP-1 --brightness '0.25'
  xset dpms force off
  set eps (math "6*$n-3")
  set sleepsec (math "round(3600 * $n)")
  waitfor $sleepsec '💤 sleep' '💤 ' &
  for f in (seq "$eps")
    sleep 600
    keycolor (getcolor random sleep_colors) 32
    xset dpms force off
  end
  sleep 300
  gsettings set org.gnome.desktop.notifications show-banners "$banners"
  gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
  xinput -enable 11
  wakeup (tty) (tput lines) (tput cols)
end
