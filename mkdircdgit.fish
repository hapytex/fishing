function mkdircdgit --description 'make a directory, if it does not yet exist, cd into that directory, and start a git repository' -a pth -a lang
  mkdircd "$pth" $argv && git init .
  for lang in $argv[2..]
    set gt (fish_home)/gitignores/$lang.gitignore
    if [ -e "$gt" -a ! -e .gitignore ]
      cat "$gt" >> .gitignore
      git add .gitignore
    end
  end
end
