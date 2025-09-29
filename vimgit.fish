function vimgit --description 'Edit the given files in the parameters, and add these to git'
  for item in $argv
    mkdir -p -- (dirname -- "$item")
    editor -- "$item"
    git add -- "$item"
  end
end
