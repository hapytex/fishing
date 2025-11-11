function facialmask --description 'register the use of a facial mask' -a kind
  measurelog health.facialmask "$kind" &
  timeout 1200 play -q -n synth 1200 brownnoise synth pinknoise mix synth sine amod 0.1 10 vol 0.2 >/dev/null 2>/dev/null &
  waitfor 1200 '' '🧖 facial mask' '🧖 ' (getcolor random heal ,)
  here_is_the_news
end
