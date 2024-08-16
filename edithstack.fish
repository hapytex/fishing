function edithstack --wraps='vim -p *.cabal src/**.hs' --description 'alias edithstack vim -p *.cabal src/**.hs'
  vim -p $argv -- *.cabal src/**.hs $argv;
end
