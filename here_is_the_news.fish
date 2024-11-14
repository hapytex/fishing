function here_is_the_news --description 'beeps three times to notify an event'
  ffplay -autoexit -nodisp -f lavfi -i 'sine=f=800:d=0.1' >/dev/null 2>/dev/null
  # play -n synth 0.1 sine 880 vol 0.5 2>/dev/null
  sleep 0.9
  ffplay -autoexit -nodisp -f lavfi -i 'sine=f=800:d=0.1' >/dev/null 2>/dev/null
  # play -n synth 0.1 sine 880 vol 0.5 2>/dev/null
  sleep 0.9
  ffplay -autoexit -nodisp -f lavfi -i 'sine=f=800:d=1' >/dev/null 2>/dev/null
  # play -n synth 1 sine 880 vol 0.5 2>/dev/null
end
