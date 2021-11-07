# Defined in - @ line 1
function pointfree --wraps='lambdabot -e "@pl $argv"' --description 'alias pointfree lambdabot -e "@pl $argv"'
  set pf (string join ' ' "$argv")
  lambdabot -e "@pl $pf";
end
