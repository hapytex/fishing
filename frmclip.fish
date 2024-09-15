function frmclip --description 'copy from the clipboard to the stdout'
  xclip -o -selection c $argv;
end
