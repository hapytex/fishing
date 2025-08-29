function gitpr --description 'open a pull request on GitHub'
  firefox (gh pr create --title (echo "$argv"))
end
