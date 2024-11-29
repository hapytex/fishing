function wakeup --description 'Make some noise to wake someone up'
  while true
    xset dpms force off
    keycolor 255 219 100 255
    sleep 0.25
    xset dpms force on
    keycolor 255 219 100 0
    sleep 0.25
  end
end
