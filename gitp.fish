function gitp --wraps='git push' --description 'alias gitp git push'
  redo whenonline git push $argv;
end
