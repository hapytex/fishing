function walking --description 'register a walk'
  measure activity.walking true &
  waitfor 2100 '🚶 walking' '🚶 '
end
