function hourcolor --description 'change the keyboard to the hour color, can be scheduled as cronjob'
  keycolor (getcolor (date +%H) hour_colors) 255
end
