function gitt --wraps='git tag' --description 'make a git tag and push the tag'
  git tag $argv;
  whenonline git push --tags;
end
