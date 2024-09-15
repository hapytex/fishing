function backup --description 'make readonly timestamped copies of the list of parameters'
  set dt (date '+%Y%m%d%H%M%S_')
  set -l targets
  for item in $argv;
    cp "$item" "$dt$item"
    set -a targets "$dt$item"
  end
  if set -q arv[1]
    chmod -w $targets
    chattr +c $targets
  end
end
