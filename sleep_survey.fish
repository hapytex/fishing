function sleep_survey --description 'A short survey about sleep quality' -a deep -a total -a quality
  measure health.sleep.deep $deep health.sleep.total $total health.sleep.quality $quality
end
