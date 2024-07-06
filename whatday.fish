# Defined in - @ line 1
function whatday --description 'specifies the day with some counters'
  set dt (date +%s -d '0:00 UTC')
  set hr (date +%H%M)
  set colors '232;20;22' '255;165;0' '250;235;54' '121;195;20' '72;125;231' '75;54;157' '112;54;157'
  set caf '🚫☕'
  if test \( '0800' -lt "$hr" \) -a \( "$hr" -lt '1900' \)
    set caf '☕'
  end
  set ds (math --scale 0 "$dt/86400")
  set dow (math "($ds + 4) % 7")
  echo -e "\e[48;2;""$colors[$dow]""m"(date)" $caf\e[0m"
end
