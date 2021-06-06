# Defined in - @ line 1
function gittmaster --wraps='git stash; git checkout master; git pull; git tag $argv; git push --tags' --description 'alias gittmaster git stash; git checkout master; git pull; git tag $argv; git push --tags'
  git stash;
  git checkout master;
  git pull; git tag $argv;
  git push --tags;
end
