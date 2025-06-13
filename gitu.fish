function gitu --wraps='git pull' --description 'alias gitu git pull'
  whenonline git pull $argv;
end
