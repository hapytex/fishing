function measure --description 'Add a given measurement at a given time and print the current timestamp' -a name -a value
  measurelog $argv
  date
end
