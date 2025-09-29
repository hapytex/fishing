function lunar --description 'determine the phase of the moon for a given date'
  set phases 🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘
  if set -q argv[1]
    set all $argv
  else
    set all 'now'
  end
  for when in $all
    set dy (date -d "$when" +%s)
    set dy (math "floor(8 * ((floor($dy/86400) - 25.5) % 29.5) / 29.5)+1")
    echo "$phases[$dy]"
  end
end
