function pwd --description 'list the file as absolute path'
  if set -q argv[1]
    echo (/usr/bin/pwd)/$argv
  else
    /usr/bin/pwd
  end
end
