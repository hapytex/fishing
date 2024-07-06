function from --wraps='/usr/bin/ipython3' --wraps='/usr/bin/ipython3'
  set tmpfile (mktemp '/tmp/XXXXXXXXXXXX.py')
  echo "from $argv" > "$tmpfile"
  /usr/bin/ipython3 --no-banner --no-confirm-exit --matplotlib=wx -i "$tmpfile"; 
end
