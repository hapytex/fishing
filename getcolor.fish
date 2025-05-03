function getcolor --description 'get the color for a given name' -a name -a palette -a join
  function inner -a name -a palette
    test -n "$palette" || set palette 'colors'
    set fl (assets)"$palette.json"
    if [ "$name" = 'random' ]
      set n (jq '.|length-1' "$fl")
      jq -r "to_entries["(random 0 $n)"].value.rgb|join(\"\n\")" "$fl"
    else if string match -q -r '^[0-9]+$' "$name"
      jq -r "to_entries["$name"].value.rgb|join(\"\n\")" "$fl"
    else
      jq -r "."(string replace -r '\s+' '_' $name | tr '[:upper:]' '[:lower:]')'.rgb|join("\n")' "$fl"
    end
  end
  if [ -n "$join" ]
    string join "$join" (inner "$name" "$palette")
  else
    inner "$name" "$palette"
  end
end
