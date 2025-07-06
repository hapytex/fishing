function dockerprune --wraps='docker system prune -a -f' --description 'prune unused docker images'
  docker system prune -a -f $argv
end
