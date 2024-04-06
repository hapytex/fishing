function python3 --wraps='/usr/bin/ipython3 --no-banner --no-confirm-exit -c "import numpy as np"' --wraps='/usr/bin/ipython3 --no-banner --no-confirm-exit' --wraps='/usr/bin/ipython3 --no-banner --no-confirm-exit --matplotlib' --wraps='/usr/bin/ipython3 --no-banner --no-confirm-exit --matplotlib=qt' --wraps='/usr/bin/ipython3 --no-banner --no-confirm-exit --matplotlib=wx' --description 'alias python3=/usr/bin/ipython3 --no-banner --no-confirm-exit --matplotlib=wx'
  /usr/bin/ipython3 --no-banner --no-confirm-exit --matplotlib=wx $argv; 
end
