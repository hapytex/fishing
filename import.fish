function import --wraps='/usr/bin/ipython3' --wraps='/usr/bin/ipython3'
  echo -en '\033]0;🐍 Python shell '(/usr/bin/pwd)'\7' &
  set tmpfile (mktemp '/tmp/XXXXXXXXXXXX.py')
  echo "import $argv" > "$tmpfile"
  /usr/bin/ipython3 --no-banner --no-confirm-exit --matplotlib=wx -i "$tmpfile"; 
end
