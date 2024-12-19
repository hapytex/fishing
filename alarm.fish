function alarm --description 'show distress'
  timeout 3600 play -q -n synth 120 sine 500 sine 540 vol 0.5 &
  while true
    for i in (seq 55 50 255)
      keycolor 237 17 6 "$i" &
      sleep 0.2
    end
    for i in (seq 200 -50 5)
      keycolor 237 17 6 "$i" &
      sleep 0.2
    end
  end
end
