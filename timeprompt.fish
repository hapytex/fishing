function timeprompt --description 'wait for a given amount of time, or until the person hits a key exits with 1 if the user interrupted' -a time
  ! bash -c "read -n 1 -t '$time'"
end
