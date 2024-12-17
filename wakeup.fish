function wakeup --description 'Make some noise to wake someone up' -a tty -a l -a c
  test -n "$tty" | set tty (tty)
  xset dpms force on
  switch (random 0 1)
    case 0
      play -q -n synth 1500 sine 220 sine 221/260 &
    case 1
      play -q -n synth 1500 sine 221/260 sine 220 &
  end
  for i in (seq 0 4)
    xrandr --output eDP-1 --brightness (math "($i+1)/5")
    set cols (getcolor $i wakeup_colors)
    keycolor $cols (math "50*$i+55")
    fill $cols $l $c > "$tty"
    sleep 300
  end
end
