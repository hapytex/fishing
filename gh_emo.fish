function gh_emo --description 'get the GitHub emoji name for a given emoji' -a emo
  jq -r '.["'(string trim $emo)'"]' (assets)/emoji_github.json
end
