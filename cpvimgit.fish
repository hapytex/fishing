function cpvimgit --description 'Copy the given file to another path, add the file to git, and start the editor' -a src
  for item in $argv[2..]
    mkdir -p (dirname -- "$item")
    cp -- "$src" "$item"
    git add -- "$item"
    editor -- "$item"
  end
end
