function pomodoro --description 'the pomodoro technique to stay focussed'
  fill 0 184 252
  set banners (gsettings get org.gnome.desktop.notifications show-banners)
  while true
    set pause 300
    set pausetype '\e[10D\e[32m[short pause]\e[0m'
    for i in (seq 4)
      xdotool key XF86AudioPlay
      notify-send -i /usr/share/icons/hicolor/64x64/apps/io.github.alarm-clock-applet.clock.png -c productivity -u low 'pomodoro ⏰' '▶️ start working'
      gsettings set org.gnome.desktop.notifications show-banners false
      waitfor 1500 '\e[100D                      \e[100D\e[31m[working]\e[0m' '▶️ working '
      xdotool key XF86AudioPlay
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
