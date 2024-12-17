function ampel --description 'Get the ampel color for the given index' -a i
  set ampels 🟢 🔶 🟥
  if [ "$i" -ge 2 ]
    set i 3
  else if [ "$i" -le 0 ]
    set i 1
  else
    set i (math "$i+1")
  end
  echo $ampels[$i]
end
