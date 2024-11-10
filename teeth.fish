function teeth --description 'help cleaning teeth'
  function draw_teeth -a cc -a tt -a kin
    set teeth_map '   o5▁ o4▁ o4▁ o3▁ o3▁ o2▁    \n   u5█ u4█ u4█ u3█ u3█ u2█    \n   i5▔ i4▔ i4▔ i3▔ i3▔ i2▔    \no5▕u5█i5▏           i2▕u2█o2▏    \n              \no6▕u6█i6▏           i1▕u1█o1▏\n                             \no6▕u6█i6▏           i1▕u1█o1▏\n                   \no7▕u7█i7▏           i0▕u0█o0▏\n                     \no7▕u7█i7▏           i0▕u0█o0▏' 'o7▕u7█i7▏           i0▕u0█o0▏\n                                \no7▕u7█i7▏           i0▕u0█o0▏\n                                  \no6▕u6█i6▏           i1▕u1█o1▏\n                   \no6▕u6█i6▏           i1▕u1█o1▏\n                   \no5▕u5█i5▏           i2▕u2█o2▏\n   i5▁ i4▁ i4▁ i3▁ i3▁ i2▁     \n   u5█ u4█ u4█ u3█ u3█ u2█\n   o5▔ o4▔ o4▔ o3▔ o3▔ o2▔    '
    set tooth_map $teeth_map[$cc]
    set col (echo -e '\e[97m')
    set ecol (echo -e '\e[90m')
    # echo "$kin -- $tt"
    echo -e (echo "\e[90m$tooth_map\e[0m" | sed -E "s/$kin$tt(.)/$col\1$ecol/g" | sed -E 's/[oui][0-9](.)/\1/g')
  end
  # based on the Tooth brushing timer of the Delta Dental of Tennessee https://youtu.be/gAODutgIIVQ
  set cheeks ⬆️  ⬇️
  set teeth 7-8 5-6 3-4 1-2
  set teeth "right "$teeth "left "$teeth[-1..1]
  set moves outside inside up
  waitfor 1200 'wait after eating' 'after eating '
  echo -en '                 \e[100D'
  set cc 1
  for cheek in $cheeks
    for move in $moves
      set tt 0
      for tooth in $teeth
        set kin (string sub -l 1 "$move")
        draw_teeth "$cc" "$tt" "$kin"
        waitfor 3 "$cheek  - $move - $tooth" "clean teeth $cheek - $move - $tooth "
        echo -en '                 \e[100D\e[12A'
        set tt (math $tt+1)
      end
    end
    set cc 2
  end
  for f in (seq 12)
    echo '                                           '
  end
  echo -en '                 \e[100D\e[12A'
  waitfor 5 'brush tongue' 'brush tongue '
  echo 'do NOT rinse with water        '
end
