function ampel --description 'Get the ampel color for the given index' -a i
  set ampels 🟢 🔶 🟥
  echo $ampels[(math "$i+1")]
end
