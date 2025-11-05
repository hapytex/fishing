function facialmask --description 'register the use of a facial mask' -a kind
  measurelog health.facialmask "$kind" &
  waitfor 1200 '' '🧖 facial mask' '🧖 '
  here_is_the_news
end
