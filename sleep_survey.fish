function sleep_survey --description 'A short survey about sleep quality' -a deep -a total -a quality
  test -n "$deep" || read -P (string unescape '\e[31mdeep sleep\e[0m> ') deep
  test -n "$total" || read -P (string unescape '\e[31mtotal sleep\e[0m> ') total
  test -n "$quality" || read -P (string unescape '\e[31msleep quality\e[0m> ') quality
  measurelog health.sleep.deep "$deep" health.sleep.total "$total" health.sleep.quality "$quality"
end
