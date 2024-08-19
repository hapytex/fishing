function hlint --wraps='hlint --color $argv | less -r' --description 'alias hlint hlint --color $argv | less -r'
 command hlint --color $argv | less -r;
end
