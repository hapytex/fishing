function backupgz --description 'make readonly timestamped compressed copies of the list of parameters'
  set dt (timestamp)
  set -l targets
  for item in $argv
    set targ $dt"_$item.gz"
    gzip -9 < "$item" > "$targ"
    set -a targets "$targ"
  end
  if set -q targets[1]
    chmod a-w -- $targets
    chattr +c -- $targets
  end
end
