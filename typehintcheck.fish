function typehintcheck --description 'Check if all defined functions have type hints'
  set h (fish_home)
  natrix "$h/check_typehints.py" $argv
end
