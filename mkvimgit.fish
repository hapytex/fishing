function mkvimgit --description 'Make the directories needed to edit a file and add the file to git'
  for item in $argv
    mkdir -p -- (dirname -- "$item")
    editor -- "$item"
    git add -- "$item"
  end
end
