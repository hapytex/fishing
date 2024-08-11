function author --description 'prefix the given filenames with the user slug'
  set -q USER_SLUG || read -Ux USER_SLUG -P 'user slug> '
  rename "s/^/""$USER_SLUG""_/g" $argv
end
