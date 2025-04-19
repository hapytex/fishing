function natrix-env --description 'run a Python program in the natrix environment' -a prog
  # natrix is a watersnake
  set fh (fish_home)
  $fh/.venv/bin/$prog $argv[2..]
end
