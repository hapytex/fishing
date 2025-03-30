function battery --description 'print the percentage of the battery' -a numerator -a denominator
  if [ ! -n "$numerator" ]
    set numerator (cat /sys/class/power_supply/BAT0/capacity)
  end
  if [ -n "$denominator" ]
    set pct (math "round(100*$numerator/$denominator)")
  else
    set pct "$numerator"
  end
  if [ "$pct" -gt 29 ]
    set emo '🔋'
  else
    set emo '🪫'
  end
  echo "$emo$pct%"
end
