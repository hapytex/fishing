function gitu --wraps='git pull' --description 'alias gitu git pull'
  redo whenonline git pull $argv;
end
