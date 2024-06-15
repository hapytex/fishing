# Defined in - @ line 1
function biblespeak --description 'speak the next verse of the bible'
  set -q BIBLE_SPEAK || set -Ux BIBLE_SPEAK 1
  bible "$BIBLE_SPEAK" | espeak
  set -Ux BIBLE_SPEAK (math "$BIBLE_SPEAK + 1")  # increment for next time
end
