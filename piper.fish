function piper -a lang
  test -n "$lang" || set lang en_US-lessac-high
  natrix -m piper -m "$lang" --output-raw 2>/dev/null | aplay -r 22050 -f S16_LE -t raw - 2>/dev/null
end
