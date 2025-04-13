function gh_emo --description 'get the GitHub emoji name for a given emoji' -a emo
  set result (jq -r '.["'(string sub --length 1 (string trim $emo))'"]' (assets)/emoji_github.json)
  echo "$result"
  if [ "$result" = 'null' ]
    return 1
  end
end
