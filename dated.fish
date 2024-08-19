function dated --description 'prefix the given filenames with the timestamp'
  rename "s/^/"(date +%Y%m%d%H%M%S)"_/g" $argv
end
