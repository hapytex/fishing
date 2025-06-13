function dockercup --description 'compose the docker containers and run this eagerly'
  docker-compose up --build $argv
end
