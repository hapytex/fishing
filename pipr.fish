function pipr --wraps='pip install -r requirements.txt' --description 'install the requirements.txt file with pip'
  if set -q argv[1]
    set itm $argv
  else
    set itm 'requirements.txt'
  end
  pip install -r $itm
end
