function lip --description 'Mark the life in pixels' -a score
  set dt (date -I -d '5 hours ago')
  measure "life.pixel@$dt" "$score"
end
