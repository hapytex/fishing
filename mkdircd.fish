function mkdircd --description 'make a directory, if it does not yet exists, and move the cd to that directory' -a dir
  mkdir -p "$dir" && cd "$dir"
end
