function airplane --description 'turn airplane mode on'
  nmcli radio all off &
  rfkill block bluetooth
  wait
end
