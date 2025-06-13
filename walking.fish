function walking --description 'register a walk'
  waitfor 2100 '🚶 walking' '🚶 '
  measure activity.walking (activity_survey)
end
