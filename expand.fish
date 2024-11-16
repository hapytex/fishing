function expand --description 'expand the {𝑎:𝑏} or {𝑎:𝑏:𝑐} expressions to a range with 𝑎 and 𝑏 (and 𝑐) integers'
  echo $argv | sed -E 's/[{](-?[0-9]+)[:](-?[0-9]+)[:](-?[0-9]+)[}]/(seq \1 \3 \2)/g;s/[{](-?[0-9]+)[:](-?[0-9]+)[:]?[}]/(seq \1 \2)/g'
end
