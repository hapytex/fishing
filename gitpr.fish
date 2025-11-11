function gitpr --description 'open a pull request on GitHub'
  set title (echo "$argv")
  firefox (gh pr create --title "$title" --body "$title" 2>&1 | tail -n 1)
end
