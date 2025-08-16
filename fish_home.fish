function fish_home --description 'get the directory where the fish functions are stored'
  if set -q argv[1]
    set pth (/usr/bin/pwd)
    cd $fish_function_path[1]
    $argv
    set st $status
    cd "$pth"
    return $st
  else
    echo $fish_function_path[1]
  end
end
