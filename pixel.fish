function pixel --description 'print a list of images to the stdout'
  set hm (fish_home)
  natrix "$hm/pixel.py" $argv
end
