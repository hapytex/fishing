function hydrate --description 'keep track of the amount of water we drink' -a amount
  test -n "$amount" || set amount '33cl'
  measurelog health.hydrate "$amount"
end
