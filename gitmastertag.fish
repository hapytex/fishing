function gitmastertag --wraps='git stash; git checkout master; git pull; git tag $argv; git push --tags' --description 'alias gitmastertag git stash; git checkout master; git pull; git tag $argv; git push --tags'
  git stash;
  git checkout master;
  git pull; git tag $argv;
  git push --tags;
end
