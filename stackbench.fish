# Defined in - @ line 1
function stackbench --wraps=stack\ bench\ --benchmark-arguments\ \'--output\ benchmarks.html\' --description alias\ stackbench\ stack\ bench\ --benchmark-arguments\ \'--output\ benchmarks.html\'
  stack bench --benchmark-arguments '--output benchmarks.html' $argv;
end
