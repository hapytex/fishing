function fill --description 'fill the entire screen with a certain color' -a r -a g -a b -a n -a c -a tl
  test -n "$r" || set r 0
  test -n "$g" || set g 0
  test -n "$b" || set b 0
  test -n "$n" || set n (tput lines)
  test -n "$c" || set c (tput cols)
  test -n "$tl" || set tl (echo -en "\e["{$n}"A\e["{$c}"D")
  set l (printf '%'$c's')
  for i in (seq $n)
    echo -en "\e[48;2;$r;$g;"$b"m$l\e[0m"
  end
  echo -n "$tl"
end
