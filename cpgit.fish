function cpgit --description 'Copy the given file to another path, and add the file to git' -a src
  for item in $argv[2..]
    mkdir -p (dirname "$item")
    cp "$src" "$item"
    git add "$item"
  end
end
