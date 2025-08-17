function vitamins --description 'take our daily vitamins and magnesium'
  waitfor 90 '' '💊 vitamins' '💊 '
  measurelog health.vitamins true
  hydrate 33cl
end
