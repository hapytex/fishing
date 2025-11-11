function notes --description 'Notebook in a loop to log entries' -a topic
  test -n topic || set topic general
  while mynote "$topic"
  end
end
