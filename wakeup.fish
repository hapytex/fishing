function wakeup --description 'Make some noise to wake someone up' -a tty
  xset dpms force on
  for i in (seq 0 4)
    xrandr --output eDP-1 --brightness (math "($i+1)/5")
    set cols (getcolor $i wakeup_colors)
    keycolor $cols (math "50*$i+55")
    fill $cols > "$tty"
    sleep 300
  end
end
