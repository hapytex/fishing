function dated --description 'add the timestamp as a prefix of the given files'
  rename "s/^/"(timestamp)"_/g" $argv
end
