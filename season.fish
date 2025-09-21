function season --description 'determine the season for a given day'
  set seasons '0100 0299 ❄️ ' '0300 0599 🌱' '0600 0899 🌻' '0900 1199 🍂' '1200 1299 ❄️ '
  if set -q argv[1]
    set all $argv
  else
    set all 'now'
  end
  for when in $all
    set dy (date -d "$when" +%m%d)
    for season in $seasons
      set s (string split ' ' $season)
      if test "$s[1]" -le "$dy" -a "$dy" -le "$s[2]"
        echo -e "$s[3]"
      end
    end
  end
end
