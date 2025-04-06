function setvar --description 'check if a variable exists, and otherwise prompt for a value'
  set -q "$argv[1]" || read -Ux "$argv[1]" -P (string unescape '$\e[31m')"$argv[1]"(string unescape '\e[0m> ')
  eval "echo \"\$$argv[1]\""
end
