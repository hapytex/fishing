# Defined in - @ line 1
function biblespeak --description 'speak the next verse of the bible'
  set -q BIBLE_SPEAK || set -Ux BIBLE_SPEAK 1
  set -q BIBLE_STEP || set -Ux BIBLE_STEP 40
  echo "$BIBLE_STEP"
  set bibleend (math "$BIBLE_SPEAK + $BIBLE_STEP - 1")
  echo "$BIBLE_SPEAK - $bibleend"
  bible "$BIBLE_SPEAK-$bibleend" | espeak
  set -Ux BIBLE_SPEAK (math "$bibleend + 1")  # increment for next time
end
