function biblespeak --description 'speak the next verse of the *Bible*'
  set bibleend (math (setvar BIBLE_SPEAK) "+1")
  # echo ( sed "$BIBLE_SPEAK!d" assets/biblebooks.txt)":1-"(sed "$bibleend!d" assets/biblebooks.txt)":1"
  bible ( sed "$BIBLE_SPEAK!d" assets/biblebooks.txt)":1-"(sed "$bibleend!d" assets/biblebooks.txt)":1" | sed -E '/^  [0-9]+ /d' | piper
  set -Ux BIBLE_SPEAK $bibleend
end
