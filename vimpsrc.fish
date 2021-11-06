# Defined in - @ line 1
function vimpsrc --wraps='vim -p src/**.hs' --description 'alias vimpsrc vim -p src/**.hs src/**.x src/**.y'
  vim -p $argv -- src/**.hs;
end
