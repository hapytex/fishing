function measure --description 'Add a given measurement at a given time' -a name -a value
  assets /usr/bin/python3 ../add_measure.py $argv
end
