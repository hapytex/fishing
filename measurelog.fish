function measurelog --description 'Add a given measurement at a given time' -a name -a value
  fish_home natrix add_measure.py $argv
end
