function gitremote --description 'add a remote as origin with the given prefix'
  git remote add origin (setvar GIT_PREFIX)"/"(basename (pwd))".git"
  git branch --set-upstream-to=origin/(setvar GIT_BRANCH) (setvar GIT_BRANCH)
end
