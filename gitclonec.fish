function gitclonec --description 'clone a repository and chance the directory to that of the cloned repository'
  set bn (basename "$argv")
  git clone $argv
  cd "$bn"
end
