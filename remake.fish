function remake --description 'a loop to remake certain products with a Makefile'
  while true
    echo -en '\e]0;'(ampel 2)'\007'
    make $argv
    echo -en '\e]0;'(ampel 0)'\007'
    bash -c 'read -n 1 -t 600 -p "Hit ENTER or any other key to remake "'
  end
end
