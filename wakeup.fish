function wakeup --description 'Make some noise to wake someone up' -a tty -a l -a c
  test -n "$tty" | set tty (tty)
  xrandr --output eDP-1 --brightness 0.2
  xset dpms force on
  switch (random 0 1)
    case 0
      play -q -n synth 1500 sine 369 sine 370/409 fade 750 vol 0.2 &
    case 1
      play -q -n synth 1500 sine 370/409 sine 369 fade 750 vol 0.2 &
  end
  for i in (seq 0 4)
    xrandr --output eDP-1 --brightness (math "($i+1)/5")
    set cols (getcolor $i wakeup_colors)
    keycolor $cols (math "50*$i+55")
    fill $cols $l $c > "$tty"
    sleep 300
  end
  alarm
end
