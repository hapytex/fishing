# Defined in - @ line 1
function vimc --description 'create a directory if the directory does not exist yet for the given filepath'
  mkdir -p (dirname $argv);
  vim -p  $argv;
end
