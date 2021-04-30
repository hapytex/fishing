# Defined in - @ line 1
function stackd --wraps='stack haddock --force-dirty' --description 'alias stackd stack haddock --force-dirty'
  stack haddock --force-dirty $argv;
end
