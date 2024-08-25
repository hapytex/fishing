function taskd --wraps=/usr/bin/task --description 'alias taskd=/usr/bin/task'
  if set -q argv[1]
      /usr/bin/task $argv done;
  end
  /usr/bin/task;
end
