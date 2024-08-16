function author --description 'prefix the given filenames with the user slug'
  rename "s/^/"(setvar USER_SLUG)"_/g" $argv
end
