function stackn --wraps='stack new' --description 'create a new Haskell stack project' -a packagename
  stack new $argv
  cd -- $packagename
end
