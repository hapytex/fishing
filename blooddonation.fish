function blooddonation --description 'register a blood donation together with blood metrics' -a kind -a bpm -a systolic -a diastolic
  test -n "$kind" || read -P (string unescape '\e[31mdonation kind\e[0m> ') kind
  test -n "$bpm" || read -P (string unescape '\e[31mBPM\e[0m> ') bpm
  test -n "$systolic" || read -P (string unescape '\e[31msystolic pressure\e[0m> ') systolic
  test -n "$diastolic" || read -P (string unescape '\e[31mdiastolic pressure\e[0m> ') diastolic
  bloodpressure "$systolic" "$diastolic" &
  measure "blooddonation.$kind" true health.bodilyfunction.bpm "$bpm" &
  waitfor 2700 '🩸 donation' '🩸 '
  here_is_the_news
end
