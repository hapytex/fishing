function gitu --wraps='git pull' --description 'alias for git pull'
  whenonline git pull $argv;
end
