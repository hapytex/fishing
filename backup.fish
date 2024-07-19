function backup --description 'make a read-only timestamped copy of a file'
  set dt (date '+%Y%m%d%H%M%S_')
  set -l targets
  for item in $argv;
    cp "$item" "$dt$item"
    set -a targets "$dt$item"
  end
  chmod -w $targets
end
