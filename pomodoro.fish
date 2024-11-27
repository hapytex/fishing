function pomodoro --description 'the pomodoro technique to stay focussed'
  fill 0 184 252
  set banners (gsettings get org.gnome.desktop.notifications show-banners)
  function noising
    switch (random 0 2)
      case 0
        timeout 1800 play -q -n synth brownnoise >/dev/null 2>/dev/null &
      case 1
        timeout 1800 play -q -n synth sine 285 sine 325 >/dev/null 2>/dev/null &
      case 2
        timeout 1800 play -q -n synth sine 325 sine 285 >/dev/null 2>/dev/null &
    end
    echo "$last_pid"
  end
  while true
    set pause 300
    set pausetype '\e[10D\e[32m[short pause]\e[0m'
    for i in (seq 4)
      xdotool key XF86AudioPlay
      notify-send -i /usr/share/icons/hicolor/64x64/apps/io.github.alarm-clock-applet.clock.png -c productivity -u low 'pomodoro ⏰' '▶️ start working'
      gsettings set org.gnome.desktop.notifications show-banners false
      set gamma (noising)
      keycolor 0 184 252
      waitfor 1500 '\e[100D                      \e[100D\e[31m[working]\e[0m' '▶️  working '
      kill "$gamma"
      xdotool key XF86AudioPlay
      keycolor 255 219 100
      here_is_the_news
      if [ "$i" -gt  3 ]
        set pause 900
        set pausetype '\e[10D\e[33m[long pause]\e[0m'
      end
      gsettings set org.gnome.desktop.notifications show-banners "$banners"
      notify-send -i /usr/share/icons/hicolor/64x64/apps/io.github.alarm-clock-applet.clock.png -c productivity -u low 'pomodoro ⏰' '⏸️ take a break'
      waitfor "$pause" "$pausetype" '⏸️ pause '
      here_is_the_news
    end
  end
end
