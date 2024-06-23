function task --wraps=/usr/bin/task --description 'alias for /usr/bin/task, also shows the last after each modification'
  if set -q argv[1]
      /usr/bin/task $argv
  end
  /usr/bin/task;
end
