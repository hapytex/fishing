function fundo --wraps='lambdabot -e "@undo $argv"' --description 'alias fundo lambdabot -e "@undo $argv"'
  set pf (string join ' ' "$argv")
  lambdabot -e "@undo $pf";
end
