function descale_coffee --description 'prevent wasting time with the coffee machine descaling process'
  measure home.coffeemachine.descale true &
  household 1320 '☕️🧼' 'coffeemachine descaling' 1 0.5
  echo 'rinse the water tank, and refill with water'
  household 240 '☕️🧼' 'coffeemachine descaling' 1 0.25
 end
