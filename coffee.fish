function coffee --description 'wait until the coffee machine has finished two cups of coffee'
  set hr (date +%H%M)
  if test \( (setvar COFFEE_MIN) -le "$hr" \) -a \( "$hr" -le (setvar COFFEE_MAX) \)
    measurelog home.coffeemachine.brew true &
    household 270 '☕☕' 'coffee' 3 0.5
  else
    echo >&2 'no coffee anymore'
    return 1
  end
end
