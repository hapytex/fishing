function getcolor --description 'get the color for a given name' -a name -a palette
  test -n "$palette" || set palette 'colors'
  jq -r "."(string replace -r '\s+' '_' $name | tr '[:upper:]' '[:lower:]')'.rgb|join("\n")' (assets)"/$palette.json"
end
