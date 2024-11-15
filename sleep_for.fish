function sleep_for --description 'Sleep a given number of hours' -a n
  if [ -z "$n" ]
    set n 7
  end
  cd "$fish_function_path[1]/assets/music/"
  nohup nice -n 19 vlc --no-random --no-loop --qt-start-minimized --play-and-exit $n'h_sleep.xspf' >/dev/null 2>/dev/null &
end
