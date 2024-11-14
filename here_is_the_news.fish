function here_is_the_news --description 'beeps three times to notify an event'
  ffplay -autoexit -nodisp -f lavfi -i 'sine=f=1000:d=0.1' >/dev/null 2>/dev/null &
  sleep 1
  ffplay -autoexit -nodisp -f lavfi -i 'sine=f=1000:d=0.1' >/dev/null 2>/dev/null &
  sleep 1
  ffplay -autoexit -nodisp -f lavfi -i 'sine=f=1000:d=0.5' >/dev/null 2>/dev/null
end
