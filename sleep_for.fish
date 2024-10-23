function sleep_for --description ''
    nohup nice -n 19 vlc --no-random --no-loop --qt-start-minimized --play-and-exit "${n}h_sleep.xspf" >/dev/null 2>/dev/null &
end
