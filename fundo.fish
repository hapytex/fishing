# Defined in - @ line 1
function pointfree --wraps='lambdabot -e "@undo $argv"' --description 'alias pointfree lambdabot -e "@undo $argv"'
  set pf (string join ' ' "$argv")
  lambdabot -e "@undo $pf";
end
