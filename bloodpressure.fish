function bloodpressure --description 'register a blood pressure measurement' -a systolic -a diastolic
  test -n "$systolic" || read -P (string unescape '\e[31msystolic pressure\e[0m> ') systolic
  test -n "$diastolic" || read -P (string unescape '\e[31mdiastolic pressure\e[0m> ') diastolic
  measure health.bodilyfunction.bloodpressure "[$diastolic, $systolic]"
end
