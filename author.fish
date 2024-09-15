function author --description 'prefix the given file names with the name of the author'
  rename "s/^/"(setvar USER_SLUG)"_/g" $argv
end
