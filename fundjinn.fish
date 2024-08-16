function fundjinn --wraps='lambdabot -e "@djinn $argv"' --description 'alias fundjinn lambdabot -e "@djinn $argv"'
  set pf (string join ' ' "$argv")
  lambdabot -e "@djinn $pf";
end
