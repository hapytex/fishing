# Defined in - @ line 1
function frmclip --wraps='xclip -selection o' --wraps='xclip -o -selection c' --description 'alias frmclip xclip -o -selection c'
  xclip -o -selection c $argv;
end
