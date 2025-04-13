function setvar --description 'check if a variable exists, and otherwise prompt for a value' -a name -a helptext
  test -n "$helptext" && set helptext " [$helptext]"
  set -q "$name" || read -Ux "$name" -P (string unescape '$\e[31m')"$name$helptext"(string unescape '\e[0m> ')
  eval "echo \"\$$name\""
end
