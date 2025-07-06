function between --description 'Check if the given values are ordered, usually used for three items to check membership of a range'
  set old $argv[1]
  for v in $argv[2..]
    test "$old" -le "$v" || return 1
    set old $v
  end
end
