# Defined in - @ line 1
function stackg --wraps='stack ghci' --description 'alias stackg stack ghci'
  stack ghci $argv;
end
