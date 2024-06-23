# Defined in - @ line 1
function pomodoro --description 'the pomodoro technique to stay focussed'
  while true
    set pause 300
    set pausetype '\e[32m[short pause]\e[0m'
    for i in (seq 4)
      echo -e '\e[31m[working]\e[0m'
      xdotool key XF86AudioPlay
      notify-send -i /usr/share/icons/hicolor/64x64/apps/io.github.alarm-clock-applet.clock.png -c productivity -u low 'pomodoro ⏰' 'start working'
      waitfor 1500
      xdotool key XF86AudioPlay
      here_is_the_news
      if [ "$i" -gt  3 ]
        set pause 900
        set pausetype '\e[33m[long pause]\e[0m'
      end
      echo -e "$pausetype"
      notify-send -i /usr/share/icons/hicolor/64x64/apps/io.github.alarm-clock-applet.clock.png -c productivity -u low 'pomodoro ⏰' 'take a break'
      waitfor "$pause"
      here_is_the_news
    end
  end
end
