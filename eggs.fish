function eggs --description 'wait until the eggs are fully cooked in the water boiler'
  echo -e 'takes \e[1m5%\e[0m of the home battery'
  waitfor 1500 '🥚 eggs' '🥚 '
end
