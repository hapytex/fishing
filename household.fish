function household --description 'wait until a household device has finished with info' -a time -a emoji -a name -a energy -a water -a keycol
  if [ -n "$keycol" ]
    keycolor (getcolor random "$keycol") 255
  end
  echo -e "takes \e[1m$energy%\e[0m of the home battery and \e[1m"$water"ℓ\e[0m water"
  waitfor $time '' "$emoji  $name" "$emoji "
  here_is_the_news
end
