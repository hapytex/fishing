function advent --description 'shows the number of candles to light for Advent' -a day
  set candles 🕯️ 🕯️🕯️ 🕯️🕯️🕯️ 🕯️🕯️🕯️🕯️
  # TODO: same year
  set christmas (date +%s --utc -d 'december 25 0:00')
  set weekday (date +%w -d "@$christmas")
  test $weekday -eq 0 && set weekday 7
  set last (math "$christmas - ($weekday * 86400)")
  set cur (date +%s --utc -d "$day")
  set cand (math "4 - ceil(($last - $cur) / 604800)")
  if [ "$cand" -le 4 -a "$cand" -gt 0 ]
    echo $candles[$cand]
    return "$cand"
  else
    echo ''
  end
end
