function wakeup --description 'Make some noise to wake someone up' -a tty
  xset dpms force on
  for i in (seq 0 4)
    set cols (getcolor $i wakeup_colors)
    keycolor $cols 255
    fill $cols > "$tty"
    sleep 300
  end
end
