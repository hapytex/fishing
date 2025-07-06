function dishwasher --description 'wait until the dishwasher has finished'
  measurelog home.dishwasher true &
  household 11700 '🍽️' 'dishwasher' 48 10
end
