function measureall --description 'Start asking for a lot of measures in bulk, used as helper function' -a prefix
  read -P (string unescape '\e[31mtimestamp\e[0m> ') timestamp
  set result ()
  for item in $argv[2..]
    set -a result "$prefix$item@$timestamp"
    read -P (string unescape '\e[31m'"$item"'\e[0m> ') val
    set -a result "$val"
  end
  measure $result
end
