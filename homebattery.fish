function homebattery --description 'determine how long it will take to load the battery full' -a cur -a upto
  test -n "$cur" || set cur 0
  test -n "$upto" || set upto 100
  measurelog home.battery "$cur" &
  # 0% -> 80% @300Watts
  set s0 (math "min(80, $upto) - min(80, $cur)")
  # 80% -> 100% @150Watts
  set s1 (math "max(80, $upto) - max(80, $cur)")
  set tot (math "round(73728*$s0/300 + 73728*$s1/150)")
  waitfor "$tot" '⚡ battery' '⚡ '
end
