function gitcp --wraps='git commit -am' --description 'commit with the given parameters, and push the changes'
  git commit -am $argv;
  gitp
end
