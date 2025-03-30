function taskflush --description 'set all expired tasks to done'
  taskd (taskd | grep -P 'P\d+D\s*[-]' | cut -d' ' -f 1)
end
