function sensors --description 'print the status of the sensors every second'
  while true
    set data (/usr/bin/sensors | string split0)
    echo "$data"
    sleep 1
    echo -en '\e['(echo "$data" | wc -l)'A'
  end
end
