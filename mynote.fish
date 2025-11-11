function mynote --description 'Add a notebook entry to a specific topic' -a topic
  test -n "$topic" || set topic general
  if set -q argv[2]
    set nt (echo $argv[2..])
  else
    set hhmm (date +%H%M)
    set nt (read -P (echo -e "\033]0;📓 $hhmm $topic notebook\a  \e[93m$hhmm>\e[0m "))
    set hhmm (date +%H%M)
    if [ ! -n "$nt" ]
      echo -e "\e[1A\r\e[31m✗ $hhmm>\e[0m"
    end
  end
  if [ -n "$nt" ]
    measurelog "notebook.$topic" "$nt"
    if ! set -q argv[2]
      echo -e "\e[1A\r\e[32m✓ $hhmm>\e[0m"
    end
  else
    return 1
  end
end
