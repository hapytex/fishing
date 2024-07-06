# Defined in - @ line 1
function biblespeak --description 'speak the next verse of the bible'
  set -q BIBLE_SPEAK || set -Ux BIBLE_SPEAK 1
  set -q BIBLE_STEP || set -Ux BIBLE_STEP 40
  set bibleend (math "$BIBLE_SPEAK + $BIBLE_STEP - 1")
  bible "$BIBLE_SPEAK-$bibleend" | espeak
  set -Ux BIBLE_SPEAK (math "$BIBLE_SPEAK + $BIBLE_STEP")  # increment for next time
end
