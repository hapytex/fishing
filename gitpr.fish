function gitpr --description 'open a pull request on GitHub'
  set title (echo "$argv")
  firefox (gh pr create --title "$title" --body "$title")
end
