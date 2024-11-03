function waitfor --description 'wait a certain amount of time, or until the user hits ENTER' -a time -a label
  if [ ! -z "$label" ]
    echo -en "$label "
  end
  for i in (seq "$time" -1 0)
    set mn (math "$i % 60")
    set hr (math --scale 0 "($i - $mn) / 60")
    set txt (printf "%02d:%02d" $hr $mn)
    set n (string length "$txt")
    echo -en "$txt\e["$n"D"
    sleep 1
  end
end
