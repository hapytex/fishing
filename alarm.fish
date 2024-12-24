function alarm --description 'show distress'
  function endpom -a gamma
    test -n "$gamma" && kill "$gamma" >/dev/null || true
  end
  timeout 3600 play -q -n synth 120 sine 500 sine 540 vol 0.5 &
  set gamma $last_pid
  trap "endpom $gamma" EXIT
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
