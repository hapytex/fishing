function washingmachine --description 'wait until the washing machine has finished'
  echo -e 'takes \e[1m53%\[0m of the home battery'
  waitfor 4380 '👕 washing machine' '👕 '
end
