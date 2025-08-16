function vimc --description 'create a directory if the directory does not yet exist before running vim'
  mkdir -p (dirname $argv);
  vim -p  $argv;
end
