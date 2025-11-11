function walking --description 'register a walk'
  waitfor 2100 '' '🚶 walking' '🚶 '
  measurelog activity.walking (activity_survey)
end
