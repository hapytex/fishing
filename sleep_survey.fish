function sleep_survey --description 'A short survey about sleep quality' -a deep -a total -a quality
  test -n "$deep" || read -P 'deep sleep> ' deep
  test -n "$total" || read -P 'total sleep> ' total
  test -n "$quality" || read -P 'deep quality> ' quality
  measure health.sleep.deep "$deep" health.sleep.total "$total" health.sleep.quality "$quality"
end
