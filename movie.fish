function movie --description 'register going to a movie' -a name
  test -n "$name" || read -P (string unescape '\e[31name of the movie\e[0m> ') name
  measure entertainment.movie "$name"
end
