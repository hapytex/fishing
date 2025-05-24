function ledger --description 'book a financial transaction and see the balance' -a am -a to -a nm -a fm -a date -a cy -a rf
  set ass (assets)
  set task 'balance'
  if set -q argv[1]
    if [ "$argv[1]" = 'budget' ]
      set task "$argv[1]"
    else
      set ams (string split '/' "$am")
      set nl (echo -e '\n')
      test -n "$dt" || set dt (date '+%Y/%m/%d')
      test -n "$am" || read -P (string unescape '\e[31mamount\e[0m> ') am
      test -n "$cy" || set cy 'E'
      test -n "$to" || read -P (string unescape '\e[31msource\e[0m> ') to
      test -n "$fm" || set fm main
      test -n "$fm" && set fm "\n  $fm"
      test -n "$rf" && set rf " ($rf)"
      test -n "$nm" || set nm transaction
      test -n "$tx" && set tx "\n  tax  $cy$tx"
      set tos (string split '/' "$to") 'tax' 'ship'
      set tot ''
      set idx 1
      for am in $ams
        set tot "$tot\n  $tos[$idx]  $cy$am"
        set idx (math "$idx+1")
      end
      echo -e "\n$dt$rf * $nm$tot$fm" | tee -a "$ass/ledger/transaction.dat"
    end
  end
  /usr/bin/ledger -f $ass/ledger/ledger.dat "$task"
end
