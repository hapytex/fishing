# Defined in - @ line 1
function edithaskell --wraps='vim -p *.cabal src/**.hs' --description 'alias edithaskell vim -p *.cabal src/**.hs'
  vim -p $argv -- *.cabal src/**.hs $argv;
end
