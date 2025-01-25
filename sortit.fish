function sortit --description 'sort the given files and copy the result to the original files'
  set tmp (mktemp)
  for item in $argv;
    sort "$item" > "$tmp" && mv -f "$tmp" "$item"
  end
end
