function vitamines --description 'take our daily vitamines and magnesium'
  waitfor 90 '💊 vitamines' '💊 '
  measurelog health.vitamines
  hydrate 33cl
end
