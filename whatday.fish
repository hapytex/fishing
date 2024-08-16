function whatday --description 'specifies the day with some counters'
  set dt (date +%s -d '0:00 UTC')
  set hr (date +%H%M)
  set -q COFFEE_MIN || set -Ux COFFEE_MIN '0800'
  set -q COFFEE_MAX || set -Ux COFFEE_MAX '1900'
  set colors '232;20;22' '255;165;0' '250;235;54' '121;195;20' '72;125;231' '75;54;157' '112;54;157'
  set tcol 37 37 30 30 37 37 37
  set planets '☽ ' '♂' '☿' '♃' '♀' '♄' '☉'
  set polars '←' '→'
  set caf '🚫☕'
  if test \( $COFFEE_MIN -le "$hr" \) -a \( "$hr" -le $COFFEE_MAX \)
    set caf '☕'
  end
  set ds (math --scale 0 "$dt/86400")
  set dow (math "(($ds + 3) % 7) + 1")
  set dp (math "($ds % 2) + 1")
  echo -e "\e[48;2;$colors[$dow];$tcol[$dow]m$planets[$dow] $polars[$dp]  "(date)" $caf  "(sdate)"\e[0m"
end
