function fill --description 'fill the entire screen with a certain color'
  set r (printf %(tput cols)s)
  for i in (seq (tput lines))
    echo -en "\e[48;2;0;184;252m$r\e[0m"
  end
end
