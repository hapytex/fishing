function keycolor --description 'Set the keyboard color to a specific color and intensity' -a r -a g -a b -a i
  test -n "$r" || set r 0
  test -n "$g" || set g 0
  test -n "$b" || set b 0
  echo "$r $g $b" > /sys/class/leds/rgb:kbd_backlight/multi_intensity
  if [ -n "$i" ]
    echo "$i" > /sys/class/leds/rgb:kbd_backlight/brightness
  end
end
