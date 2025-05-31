function biblespeak --description 'speak the next verse of the *Bible*'
  set bibleend (math (setvar BIBLE_SPEAK) "+1")
  set chap (string split , -- (sed "$BIBLE_SPEAK!d" (assets)/bibleverses.csv))
  bible "$chap[1]:1-$chap[1]:$chap[2]" | sed -E '/^  [0-9]+ /d' | piper
  set -Ux BIBLE_SPEAK $bibleend
end
