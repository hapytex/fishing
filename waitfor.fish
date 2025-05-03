function waitfor --description 'wait a certain amount of time, or until the user hits ENTER' -a time -a label -a desc -a keydown -a until -a step
  if [ -n "$keydown" ]
    keycolor (string split , "$keydown") 255 &
  end
  if set emo_name (gh_emo "$desc")
    gh_status '' "$emo_name" "$time seconds" false  &
  end
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
    set txt (timeformat "$i")
    set n (string length "$txt")
    if [ "$n" -lt "$oldn" ]
      # erase previous one if length differs
      echo -en '        \e[8D'
    end
    set cl (math "min(255, 4*$i)")
    echo -en "\e[1m\e[38;2;255;$cl;"$cl"m$txt\e[0m\e["$n"D"
    set pct (math "round(100*($time-$i)/$time)")
    echo -en "\033]0;$desc$txt\007\033]9;4;1;$pct\033\0134"
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
