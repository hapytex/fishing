function waitfor --description 'wait a certain amount of time, or until the user hits ENTER' -a time -a allow -a label -a desc -a keydown -a until -a step
  set es 0
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
  set clems '○' '◔' '◑' '◕' '●'
  set c (tput cols)
  set ll (string length "$label")
  set c (math "$c - $ll")
  test -n "$until" || set until 0
  test -n "$step" || set step 1
  set oldval 256
  set oldn 8
  set time (math "round($time)")
  set cur (date '+%s')
  set tar (math "$cur + $time")
  while test "$cur" -lt "$tar"
    set rmd (math "$tar - $cur")
    set txt (timeformat "$rmd")
    set n (string length "$txt")
    if [ "$n" -lt "$oldn" ]
      # erase previous one if length differs
      echo -en '        \e[8D'
    end
    set ll (string length "$desc$txt")
    set rm (math "$c - $ll - 1")
    set nn (math "round($rm*($time-$rmd)/$time)")
    set fl (string repeat -n$nn '█')
    set nnn (math "$n+$nn+1")
    set cl (math "min(255, 4*$rmd)")
    echo -en "\e[1m\e[38;2;255;$cl;"$cl"m$txt $fl\e[0m\e["$nnn"D"
    set pct (math "round(100*($time-$rmd)/$time)")
    set pcf (math "max(1, min(5, floor($pct/20)+1))")
    echo -en "\033]0;$clems[$pcf]$desc$txt\007\033]9;4;1;$pct\033\0134"
    if [ -n "$keydown" ]
      set newval (math "round(235*$rmd/$time)+20")
      if [ "$oldval" -ne "$newval" ]
         echo "$newval" > /sys/class/leds/rgb:kbd_backlight/brightness &
         set oldval $newval
      end
    end
    if [ -z "$allow" ]
      if ! timeprompt "$step"
        set cur "$tar"
        set es 1
      else
        set cur (date '+%s')
      end
    else
      sleep "$step"
      set cur (date '+%s')
    end
    set oldn "$n"
  end
  # clear progress
  echo -en "\033]9;4;0\007"
  return "$es"
end
