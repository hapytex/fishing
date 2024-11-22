function fill --description 'fill the entire screen with a certain color' -a r -a g -a b
  set l (printf %(tput cols)s)
  for i in (seq (tput lines))
    echo -en "\e[48;2;$r;$g;"$b"m$l\e[0m"
  end
end
