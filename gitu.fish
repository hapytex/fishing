# Defined in - @ line 1
function gitu --wraps='git pull' --description 'alias gitu git pull'
  git pull $argv;
end
