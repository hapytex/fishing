function swapfiles --description 'swap two or more files';
  set targ (mktemp)
  set final "$targ"
  for i in $argv
    mv "$i" "$targ"
    set targ "$i"
  end
  mv "$final" "$targ"
end
