# Defined in - @ line 1
function whatday --description 'specifies the day with some counters'
  set dt (date +%s -d '0:00 UTC')
  set ds (math --scale 0 "$dt/86400")
  set dow (math "($ds % 7) + 1")
  echo -e "\e[3""$dow""m"(date)"\e[0m"
end
