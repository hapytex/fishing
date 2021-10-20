# Defined in - @ line 1
function stackbench --wraps=stack\ bench\ --benchmark-arguments\ \'--output\ benchmarks.html\' --description alias\ stackbench\ stack\ bench\ --benchmark-arguments\ \'--output\ benchmarks.html\'
  set mem (ulimit -Sv)
  ulimit -Sv 6000000
  stack bench --benchmark-arguments '--output benchmarks.html' $argv;
  ulimit -Sv "$mem"
end
