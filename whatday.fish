function whatday --description 'specifies the day with some counters'
  set dt (date +%s -d '0:00 UTC')
  set hr (date +%H%M)
  set colors '232;20;22' '255;165;0' '250;235;54' '121;195;20' '72;125;231' '75;54;157' '112;54;157'
  set tcol 97 97 30 30 30 97 97
  set planets '☽ ' '♂' '☿' '♃' '♀' '♄' '☉'
  set polars '←' '→'
  set caf '🚫☕'
  if test \( (setvar COFFEE_MIN) -le "$hr" \) -a \( "$hr" -le (setvar COFFEE_MAX) \)
    set caf '☕'
  end
  set ds (math --scale 0 "$dt/86400")
  set dow (math "(($ds + 3) % 7) + 1")
  set dp (math "($ds % 2) + 1")
  echo -e "\e[48;2;$colors[$dow];$tcol[$dow]m$polars[$dp]  $planets[$dow] "(date '+%d %b')" $caf  "(sdate)" "(advent)" \e[0m"
end
