function gitp --wraps='git push' --description 'alias gitp git push'
  redo git push $argv;
end
