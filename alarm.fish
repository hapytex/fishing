function alarm --description 'show distress'
  function endpom -a gamma
    if kill -0 "$gamma" >/dev/null
      kill "$gamma" >/dev/null 
    end
  end
  xrandr --output eDP-1 --brightness '1.0' &
  xset dpms force on &
  timeout 3600 play -q -n synth 3 sin 960 sine 1000 synth 3 sin fmod 1920 fade l 0 3 2.8 trim 0 1 repeat 3600 &
  set gamma $last_pid
  disown "$gamma"
  trap "endpom $gamma" EXIT KILL INT QUIT STOP
  while kill -0 "$gamma"
    for i in (seq 55 50 255)
      set rr (math "round(237*$i/255)")
      set gg (math "round(17*$i/255)")
      set bb (math "round(6*$i/255)")
      keycolor 237 17 6 "$i" &
      fill $rr $gg $bb
      sleep 0.2
    end
    for i in (seq 200 -50 5)
      set rr (math "round(237*$i/255)")
      set gg (math "round(17*$i/255)")
      set bb (math "round(6*$i/255)")
      keycolor 237 17 6 "$i" &
      fill $rr $gg $bb
      sleep 0.2
    end
  end
end
