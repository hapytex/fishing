function llive --description 'update the directory listing every second'
  while true
    set data (ll $argv | string split0)
    echo "$data"
    sleep 1
    echo -en '\e['(echo "$data" | wc -l)'A'
  end
end
