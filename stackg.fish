# Defined in - @ line 1
function stackg --wraps='stack ghci' --description 'alias stackg stack ghci'
  set mem (ulimit -Sv)
  ulimit -Sv 500000
  stack ghci --ghc-options="$argv";
  ulimit -Sv "$mem"
end
