function waitfor --description 'wait a certain amount of time, or until the user hits ENTER' -a time -a label -a desc -a keydown -a until -a step
  if [ ! -z "$label" ]
    set label "$label "
    echo -en "$label"
  else
    set label ''
  end
  test -n "$until" || set until 0
  test -n "$step" || set step 1
  set oldval 256
  set oldn 8
  set time (math "round($time)")
  for i in (seq "$time" "-$step" "$until")
    set sc (math "$i % 60")
    set mn (math --scale 0 "($i - $sc) / 60")
    set txt (printf "%02d:%02d" $mn $sc)
    if [ "$mn" -ge 60 ]
      set hr (math "floor($mn / 60)")
      set mn (math "$mn - 60*$hr")
      set txt (printf "%02d:%02d:%02d" $hr $mn $sc)
    end
    set n (string length "$txt")
    if [ "$n" -lt "$oldn" ]
      # erase previous one if length differs
      echo -en '        \e[8D'
    end
    set cl (math "min(255, 4*$i)")
    echo -en "\e[1m\e[38;2;255;$cl;"$cl"m$txt\e[0m\e["$n"D"
    set pct (math "round(100*($time-$i)/$time)")
    echo -en "\033]0;$desc$txt\007\033]9;4;1;$pct;\007"
    if [ -n "$keydown" ]
      set newval (math "round(235*$i/$time)+20")
      if [ "$oldval" -ne "$newval" ]
         echo "$newval" > /sys/class/leds/rgb:kbd_backlight/brightness &
         set oldval $newval
      end
    end
    sleep "$step"
    set oldn "$n"
  end
  # clear progress
  echo -en "\033]9;4;0\007"
end
