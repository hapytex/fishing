function gitcpr --description 'commit with the given parameters, push the changes and open een pull request'
  set message (echo "$argv")
  git commit -am $argv;
  gitp
  gh pr create --title "$message" --head
end
