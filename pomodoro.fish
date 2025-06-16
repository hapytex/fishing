function pomodoro --description 'the pomodoro technique to stay focussed'
  fill 0 184 252
  set banners (gsettings get org.gnome.desktop.notifications show-banners)
  function endpom -a gamma
    test -n "$gamma" && kill "$gamma" >/dev/null || true
  end
  function noising
    switch (random 0 2)
      case 0
        timeout 1800 play -q -n synth brownnoise vol 0.2 >/dev/null 2>/dev/null &
      case 1
        timeout 1800 play -q -n synth sine 285 sine 325 vol 0.2 >/dev/null 2>/dev/null &
      case 2
        timeout 1800 play -q -n synth sine 325 sine 285 vol 0.2 >/dev/null 2>/dev/null &
    end
    echo "$last_pid"
  end
  while true
    set pause 300
    set pausetype '\e[10D\e[32m[short pause]\e[0m'
    set pausetitle '⏸️ '
    for i in (seq 4)
      xdotool key XF86AudioPlay &
      notify-send -i /usr/share/icons/hicolor/64x64/apps/io.github.alarm-clock-applet.clock.png -c productivity -u low 'pomodoro ⏰' '▶️ start working'
      gsettings set org.gnome.desktop.notifications show-banners false
      set gamma (noising)
      trap "endpom $gamma" EXIT
      gh_status 'Focusing' 'arrow_forward' '25 minutes' true
      set end (date '+%Y-%m-%d %H:%M:%S%z' -d "+40 minutes")
      echo "$end" > "$HOME/block_sleep"
      measurelog pomodoro.work true &
      waitfor 1500 '\e[100D                      \e[100D\e[31m[working]\e[0m' '▶️  ' (getcolor random focus_colors ,)
      kill "$gamma"
      if [ "$i" -gt  3 ]
        set waitcolor '255,3,32'
        set pause 900
        set pausetype '\e[10D\e[33m[long pause]\e[0m'
        set pausetitle '⏹️ '
        gh_status 'Long pause' 'stop_button' '15 minutes' false
      else
        set waitcolor (getcolor random heal_colors ,)
        gh_status 'Short pause' 'pause_button' '5 minutes' false
      end
      xdotool key XF86AudioPlay &
      here_is_the_news &
      gsettings set org.gnome.desktop.notifications show-banners "$banners"
      notify-send -i /usr/share/icons/hicolor/64x64/apps/io.github.alarm-clock-applet.clock.png -c productivity -u low 'pomodoro ⏰' '⏸️ take a break'
      measurelog pomodoro.pause true &
      waitfor "$pause" "$pausetype" "$pausetitle" "$waitcolor"
      here_is_the_news &
    end
  end
end
