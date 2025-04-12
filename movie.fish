function movie --description 'register going to a movie' -a name -a duration
  test -n "$name" || read -P (string unescape '\e[31name of the movie\e[0m> ') name
  # measure entertainment.movie "$name"
  if test -n "$duration"
    waitfor "$duration" '🎥 movie' '🎥 '
    here_is_the_news
  end
end
