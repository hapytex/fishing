function list --description 'Add or inspect a (shopping) list' -a name
  set pth (/usr/bin/pwd)
  cd (assets)
  /usr/bin/python3 ../add_list.py $argv
  cd "$pth"
end
