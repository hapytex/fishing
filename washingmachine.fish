function washingmachine --description 'wait until the washing machine has finished'
  echo -e 'takes \e[1m53%\e[0m of the home battery and \e[1m70ℓ\e[0m water'
  waitfor 4380 '👕 washing machine' '👕 '
end
