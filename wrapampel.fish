function wrapampel --description 'set the terminal title with the ampel signs between the start and the end of the given command'
  echo -en '\e]0;'(ampel 2)'\7'
  $argv
  set ret $status
  echo -en '\e]0;'(ampel 0)'\7'
  return $ret
end
