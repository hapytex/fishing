function sensors --description 'show the temperature measured by sensors updated every second'
  live /usr/bin/sensors $argv
end
