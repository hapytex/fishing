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
    set pausetitle '⏸️ pause '
    for i in (seq 4)
      xdotool key XF86AudioPlay &
      notify-send -i /usr/share/icons/hicolor/64x64/apps/io.github.alarm-clock-applet.clock.png -c productivity -u low 'pomodoro ⏰' '▶️ start working'
      gsettings set org.gnome.desktop.notifications show-banners false
      set gamma (noising)
      trap "endpom $gamma" EXIT
      keycolor (getcolor random focus_colors) 255
      gh_status 'Focusing' 'arrow_forward' (date '+%Y-%m-%dT%H:%M:%S%z' -d '25 minutes') true
      waitfor 1500 '\e[100D                      \e[100D\e[31m[working]\e[0m' '▶️  working ' 1
      kill "$gamma"
      if [ "$i" -gt  3 ]
        keycolor 255 3 32 255
        set pause 900
        set pausetype '\e[10D\e[33m[long pause]\e[0m'
        set pausetitle '⏹️ pause '
        gh_status 'Long pause' 'stop_button' (date '+%Y-%m-%dT%H:%M:%S%z' -d '15 minutes') false
      else
        keycolor (getcolor random heal_colors) 255
        gh_status 'Short pause' 'pause_button' (date '+%Y-%m-%dT%H:%M:%S%z' -d '5 minutes') false
      end
      xdotool key XF86AudioPlay &
      here_is_the_news &
      gsettings set org.gnome.desktop.notifications show-banners "$banners"
      notify-send -i /usr/share/icons/hicolor/64x64/apps/io.github.alarm-clock-applet.clock.png -c productivity -u low 'pomodoro ⏰' '⏸️ take a break'
      waitfor "$pause" "$pausetype" "$pausetitle" 1
      here_is_the_news &
    end
  end
end
