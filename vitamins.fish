function vitamins --description 'take our daily vitamines and magnesium'
  waitfor 90 '💊 vitamins' '💊 '
  measurelog health.vitamins
  hydrate 33cl
end
