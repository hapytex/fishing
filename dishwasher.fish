function dishwasher --description 'wait until the dishwasher has finished'
  echo -e 'takes \e[1m48%\e[0m of the home battery and \e[1m10ℓ\e[0m water'
  waitfor 11700 '🍽️  dishwasher' '🍽️ '
end
