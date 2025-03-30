function presleep --description 'first gradually make a person sleepy before the sleep_for'
  test -n "$tty" | set tty (tty)
  switch (random 0 1)
    case 0
      play -q -n synth 1500 sine 369 sine 409/370 fade 0 0 750 vol 0.2 &
    case 1
      play -q -n synth 1500 sine 409/370 sine 369 fade 0 0 750 vol 0.2 &
  end
  for i in (seq 4 -1 0)
    set cols (getcolor $i wakeup_colors)
    keycolor $cols (math "50*$i+55")
    sleep 300
  end
  sleep_for $argv
end
