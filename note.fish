function note --description 'Add a notebook entry'
  if set -q argv[1]
    set nt (echo $argv)
  else
    set hhmm (date +%H%M)
    set nt (read -P (echo -e "\033]0;📓 $hhmm Notebook entry\a  \e[93m$hhmm>\e[0m "))
    set hhmm (date +%H%M)
    if [ ! -n "$nt" ]
      echo -e "\e[1A\r\e[31m✗ $hhmm>\e[0m"
    end
  end
  if [ -n "$nt" ]
    measurelog notebook "$nt"
    if ! set -q argv[1]
      echo -e "\e[1A\r\e[32m✓ $hhmm>\e[0m"
    end
  else
    return 1
  end
end
