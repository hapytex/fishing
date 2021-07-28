# Defined in - @ line 1
function vimpsrc --wraps='vim -p src/**.hs' --description 'alias vimpsrc vim -p src/**.hs'
  vim -p src/**.hs $argv;
end
