function natrix --description 'the Python interpreter of the fish environment'
  # natrix is a watersnake
  set fh (fish_home)
  $fh/.venv/bin/python $argv
end
