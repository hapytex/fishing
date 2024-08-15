function gitremote --description 'add a remote as origin with the given prefix'
  set -q GIT_PREFIX || read -Ux GIT_PREFIX -P 'default git prefix> '
  git remote add origin "$GIT_PREFIX/"(basename (pwd))".git"
end
