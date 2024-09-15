function edithstack --wraps='vim -p *.cabal src/**.hs' --description 'will run the editor with the `.cabal` file(s) and the `.hs` files in the `src/` directory'
  vim -p $argv -- *.cabal src/**.hs $argv;
end
