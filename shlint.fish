# Defined in - @ line 1
function shlint --wraps='curl -sSL https://raw.github.com/ndmitchell/hlint/master/misc/run.sh | sh -s $argv --color | less -r' --description 'alias shlint curl -sSL https://raw.github.com/ndmitchell/hlint/master/misc/run.sh | sh -s $argv --color | less -r'
  curl -sSL https://raw.github.com/ndmitchell/hlint/master/misc/run.sh | sh -s -- $argv --color | less -r;
end
