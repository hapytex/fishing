function teeth --description 'help cleaning teeth'
  # based on the Tooth brushing timer of the Delta Dental of Tennessee https://youtu.be/gAODutgIIVQ
  set cheeks ⬆️  ⬇️
  set teeth 7-8 5-6 3-4 1-2
  set teeth "right "$teeth "left "$teeth[-1..1]
  set moves outside inside up
  waitfor 1200 'wait after eating' 'after eating '
  echo -en '                 \e[100D'
  for cheek in $cheeks
    for move in $moves
      for tooth in $teeth
        waitfor 3 "$cheek  - $move - $tooth" "clean teeth $cheek - $move - $tooth "
        echo -en '                 \e[100D'
      end
    end
  end
end
