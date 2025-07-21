function lunar --description 'determine the phase of the moon for a given date' -a when
  test -n "$when" || set when 'now'
  set phases 🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘
  set dy (date -d "$when" +%s)
  set dy (math "floor(8 * ((floor($dy/86400) - 25.5) % 29.5) / 29.5)+1")
  echo "$phases[$dy]"
end
