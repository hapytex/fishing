function dated --description 'add the timestamp as a prefix of the given files'
  rename "s/^/"(date +%Y%m%d%H%M%S)"_/g" $argv
end
