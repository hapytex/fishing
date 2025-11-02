function setvar --description 'check if a variable exists, and otherwise prompt for a value' -a name -a helptext
  if ! set -q name
      test -n "$helptext" && set helptext " [$helptext]"
      read -Ux "$name" -P (string unescape '$\e[31m')"$name$helptext"(string unescape '\e[0m> ')
  end
  eval "echo \"\$$name\""
end
