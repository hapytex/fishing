function timeformat --description 'Format time in hours, minutes and seconds' -a i
    set sc (math "$i % 60")
    set mn (math --scale 0 "($i - $sc) / 60")
    set txt (printf "%02d:%02d" $mn $sc)
    if [ "$mn" -ge 60 ]
      set hr (math "floor($mn / 60)")
      set mn (math "$mn - 60*$hr")
      set txt (printf "%02d:%02d:%02d" $hr $mn $sc)
    end
    echo "$txt"
end
