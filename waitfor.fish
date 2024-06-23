# Defined in - @ line 1
function waitfor --description 'wait a certain amount of time, or until the user hits ENTER' -a time
  for i in (seq "$time" -1 0)
    set mn (math "$i % 60")
    set hr (math --scale 0 "($i - $mn) / 60")
    printf "%02d:%02d\e[100D" $hr $mn
    sleep 1
  end
end
