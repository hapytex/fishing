function note --description 'Add a notebook entry'
  if set -q argv[1]
    set nt (echo $argv)
  else
    set hhmm (date +%H%M)
    set nt (read -P (echo -e "\033]0;📓 $hhmm Notebook entry\a  \e[93m$hhmm>\e[0m "))
    set hhmm (date +%H%M)
    echo -e "\033[1A\r\e[32m✓ $hhmm>\e[0m"
  end
  if [ -n "$nt" ]
    measurelog notebook "$nt"
  else
    return 1
  end
end
