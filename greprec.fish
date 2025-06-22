function greprec --description 'recursively search for files matching the given glob' -a glob
  grep -r --include "$glob" $argv[2..] .
end
