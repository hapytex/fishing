function taskd --wraps=/usr/bin/task --description 'alias taskd=/usr/bin/task'
  /usr/bin/task $argv done;
  /usr/bin/task;
end
