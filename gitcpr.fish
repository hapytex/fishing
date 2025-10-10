function gitcpr --description 'commit with the given parameters, push the changes and open a pull request on GitHub'
  set message (echo "$argv")
  git commit -am $argv;
  gitp
  gitpr $argv
end
