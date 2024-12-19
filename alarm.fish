function alarm --description 'show distress'
  while true
    for i in (seq 55 50 255)
      keycolor 237 17 6 "$i" &
      sleep 0.1
    end
    for i in (seq 200 -50 5)
      keycolor 237 17 6 "$i" &
      sleep 0.1
    end
  end
end
