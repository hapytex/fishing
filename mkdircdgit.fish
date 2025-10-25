function mkdircdgit --description 'make a directory, if it does not yet exist, cd into that directory, and start a git repository' -a pth -a lang
  mkdircd "$pth" $argv && git init .
  if [ -n "$lang" ]
    set gt (fish_home)/gitignores/$lang.gitignore
    if [ -e "$gt" ]
      cp "$gt" .gitignore
    end
  end
end
