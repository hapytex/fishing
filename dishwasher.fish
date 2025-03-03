function dishwasher --description 'wait until the dishwasher has finished'
  echo -e 'takes \e[1m48%\e[0m of the home battery'
  waitfor 11700 '🍽️  dishwasher' '🍽️ '
end
