function activity_survey --description 'A short survey about a physical activity' -a bpm -a steps -a dist -a kcal
  test -n "$bpm" || read -P (string unescape '\e[31mBMP\e[0m> ') bpm
  test -n "$steps" || read -P (string unescape '\e[31msteps\e[0m> ') steps
  test -n "$dist" || read -P (string unescape '\e[31mdistance\e[0m> ') dist
  test -n "$kcal" || read -P (string unescape '\e[31mheat [㎉]\e[0m> ') kcal
  echo "[$bpm, $steps, $dist, $kcal]"
end
