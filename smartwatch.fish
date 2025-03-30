function smartwatch --description 'determine how long it will take to load the smartwatch' -a cur -a upto
  test -n "$cur" || set cur 0
  test -n "$upto" || set upto 100
  measure home.smartwatch "[$cur, $upto]" &
  set tot (math "round(51.724137931*($upto-$cur))")
  waitfor "$tot" '⌚ battery' '⌚ '
  here_is_the_news
end
