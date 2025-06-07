function gitp --wraps='git push' --description 'alias gitp git push'
  whenonline git push $argv;
end
