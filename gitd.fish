# Defined in - @ line 1
function gitd --wraps='git diff $argv | less -r' --description 'alias gitd git diff $argv | less -r'
  git diff --color=always $argv | less -r;
end
