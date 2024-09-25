function ... --description 'move to the root directory of the git repository'
  cd (git rev-parse --show-toplevel)
end
