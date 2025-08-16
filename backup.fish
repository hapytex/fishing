function backup --description 'make readonly timestamped copies of the list of parameters'
  set dt (timestamp)
  set -l targets
  for item in $argv;
    cp -- "$item" $dt"_$item"
    set -a targets $dt"_$item"
  end
  if set -q targets[1]
    chmod a-w -- $targets
    chattr +c -- $targets
  end
end
