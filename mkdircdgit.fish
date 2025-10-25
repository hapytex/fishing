function mkdircdgit --description 'make a directory, if it does not yet exist, cd into that directory, and start a git repository'
  mkdircd $argv && git init .
end
