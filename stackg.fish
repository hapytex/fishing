function stackg --wraps='stack ghci' --description 'alias stackg stack ghci'
  set mem (ulimit -Sv)
  ulimit -Sv 6000000
  stack ghci --ghc-options="$argv";
  ulimit -Sv "$mem"
end
