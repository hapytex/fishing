function mkdircd --description 'make a directory, if it does not yet exist, and cd into that directory' -a dir
  mkdir -p "$dir" && cd "$dir"
end
