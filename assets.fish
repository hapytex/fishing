function assets --description 'get the directory where the fish assets are stored'
  if set -q argv[1]
    set pth (/usr/bin/pwd)
    cd (fish_home)/assets/
    $argv
    set st $status
    cd "$pth"
    return $st
  else
    echo (fish_home)/assets/
  end
end
