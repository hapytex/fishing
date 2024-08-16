function vimpsrc --wraps='vim -p src/**.hs' --description 'alias vimpsrc vim -p src/**.hs src/**.x src/**.y'
  vim -p $argv -- src/**.hs;
end
