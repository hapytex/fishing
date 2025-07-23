function live --description 'run a command every second and update the result in the console'
  while true
    set data ($argv | string split0)
    echo "$data"
    sleep 1
    echo -en '\e['(echo "$data" | wc -l)'A'
  end
end
