function ledger --description 'book a financial transaction and see the balance' -a am -a to -a fm -a nm -a date -a cy -a rf
  set ass (assets)
  if set -q argv[1]
    set nl (echo -e '\n')
    test -n "$dt" || set dt (date '+%Y/%m/%d')
    test -n "$am" || read -P (string unescape '\e[31mamount\e[0m> ') am
    test -n "$cy" || set cy 'E'
    test -n "$to" || read -P (string unescape '\e[31msource\e[0m> ') to
    test -n "$fm" || set fm main
    test -n "$fm" && set fm "\n  $fm"
    test -n "$rf" && set rf " ($rf)"
    test -n "$nm" || set nm transaction
    echo -e "$dt$rf * $nm\n  $to  $cy$am$fm" | tee -a "assets/ledger/transaction.dat"
  end
  /usr/bin/ledger -f $ass/ledger/ledger.dat balance
end
