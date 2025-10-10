function pydoc --description 'Add doc strings to all elements of a Python file'
  set h (fish_home)
  natrix "$h/add_docstrings.py" $argv
end
