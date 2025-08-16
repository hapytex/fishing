function live --description 'run a command every second and update the result in the console'
  set pre ''
  while true
    set data ($argv | string split0)
    echo "$pre$data"
    sleep 1
    set pre (echo -en '\e['(echo "$data" | wc -l)'A')
  end
end
