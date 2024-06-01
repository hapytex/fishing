# Defined in - @ line 1
function pomodoro --description 'the pomodoro technique to stay focussed'
  while true
    set pause 300
    set pausetype '\e[32m[short pause]\e[0m    \e[100D'
    for i in (seq 4)
      echo -en '\e[31m[working]\e[0m        \e[100D'
      sleep 1500
      here_is_the_news
      if [ "$i" -gt  3 ]
        set pause 900
        set pausetype '\e[33m[long pause]\e[0m    \e[100D'
      end
      echo -en "$pausetype"
      sleep "$pause"
      here_is_the_news
    end
  end
end
