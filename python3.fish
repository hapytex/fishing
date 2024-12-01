function python3 --wraps='/usr/bin/ipython3 --no-banner --no-confirm-exit -c "import numpy as np"' --description 'alias python3=/usr/bin/ipython3 --no-banner --no-confirm-exit --matplotlib=wx'
  echo -en '\033]0;🐍 Python shell\7' &
  /usr/bin/ipython3 --no-banner --no-confirm-exit --matplotlib=wx $argv; 
end
