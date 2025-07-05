function mkvim --description 'Make the directories needed to edit a file'
  for item in $argv
    mkdir -p (dirname "$item")
    editor "$item"
  end
end
