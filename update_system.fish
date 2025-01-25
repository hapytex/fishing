function update_system --description 'update the system in an asynchronous way'
  cabal update &
  sudo snap refresh &
  sudo apt-get -y update
  sudo apt-get -y upgrade
  wait
end
