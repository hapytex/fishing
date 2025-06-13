function blooddonation --description 'register a blood donation together with blood metrics' -a kind -a systolic -a diastolic -a bpm
  test -n "$kind" || read -P (string unescape '\e[31mdonation kind\e[0m> ') kind
  test -n "$systolic" || read -P (string unescape '\e[31msystolic pressure\e[0m> ') systolic
  test -n "$diastolic" || read -P (string unescape '\e[31mdiastolic pressure\e[0m> ') diastolic
  test -n "$bpm" || read -P (string unescape '\e[31mBPM\e[0m> ') bpm
  bloodpressure "$systolic" "$diastolic" &
  measure "blooddonation.$kind" true health.bodilyfunction.bpm "$bpm" &
  waitfor 2700 '🩸 donation' '🩸 ' (getcolor blood body_colors ,)
  here_is_the_news
end
