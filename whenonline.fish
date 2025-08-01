function whenonline --description 'wait to execute a command until the system can somehow contact the outer world'
  while ! ping -W 0.50 -c 1 8.8.8.8 >/dev/null 2>/dev/null
  end
  $argv
end
