# Defined in - @ line 1
function here_is_the_news --description 'beeps three times to notify an event'
  play -n synth 0.1 sine 880 vol 0.5 2>/dev/null
  sleep 0.9
  play -n synth 0.1 sine 880 vol 0.5 2>/dev/null
  sleep 0.9
  play -n synth 1 sine 880 vol 0.5 2>/dev/null
end
