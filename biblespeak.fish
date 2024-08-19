function biblespeak --description 'speak the next verse of the bible'
  set bibleend (math (setvar BIBLE_SPEAK)" + "(setvar BIBLE_STEP)" - 1")
  bible "$BIBLE_SPEAK-$bibleend" | espeak
  set -Ux BIBLE_SPEAK (math "$bibleend + 1")  # increment for next time
end
