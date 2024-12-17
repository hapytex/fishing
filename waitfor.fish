function waitfor --description 'wait a certain amount of time, or until the user hits ENTER' -a time -a label -a desc -a keydown
  if [ ! -z "$label" ]
    set label "$label "
    echo -en "$label"
  else
    set label ''
  end
  set oldval 256
  for i in (seq "$time" -1 0)
    set mn (math "$i % 60")
    set hr (math --scale 0 "($i - $mn) / 60")
    set txt (printf "%02d:%02d" $hr $mn)
    set n (string length "$txt")
    echo -en "$txt\e["$n"D"
    echo -en "\033]0;$desc$txt\007"
    if [ -n "$keydown" ]
      set newval (math "round(255*$i/$time)")
      if [ "$newval" -gt 20 -a "$oldval" -ne "$newval" ]
         echo "$newval" > /sys/class/leds/rgb:kbd_backlight/brightness &
         set oldval $newval
      end
    end
    sleep 1
  end
end
