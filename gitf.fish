function gitu --wraps='git fetch' --description 'alias for git fetch'
  whenonline git fetch $argv;
end
