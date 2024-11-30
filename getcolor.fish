function getcolor --description 'get the color for a given name' -a name
  jq "."(string replace -r '\s+' '_' $name | tr '[:upper:]' '[:lower:]') (assets)/colors.json
end
