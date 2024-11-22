function fill --description 'fill the entire screen with a certain color' -a r -a g -a b
  test -n "$r" || set r 0
  test -n "$g" || set g 0
  test -n "$b" || set b 0
  set l (printf %(tput cols)s)
  for i in (seq (tput lines))
    echo -en "\e[48;2;$r;$g;"$b"m$l\e[0m"
  end
end
