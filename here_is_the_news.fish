function here_is_the_news --description 'beeps three times to notify an event'
  # https://en.wikipedia.org/wiki/Greenwich_Time_Signal
  for __ in (seq 5)
    ffplay -autoexit -nodisp -f lavfi -i 'sine=f=1000:d=0.1' >/dev/null 2>/dev/null &
    sleep 1
  end
  ffplay -autoexit -nodisp -f lavfi -i 'sine=f=1000:d=0.5' >/dev/null 2>/dev/null
end
