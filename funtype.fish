# Defined in - @ line 1
function funtype --wraps='lambdabot -e "@type $argv"' --description 'alias funtype lambdabot -e "@type $argv"'
  set pf (string join ' ' "$argv")
  lambdabot -e "@type $pf";
end
