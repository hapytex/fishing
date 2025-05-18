function piper
  natrix -m piper -m en_US-lessac-medium --output-raw 2>/dev/null | aplay -r 22050 -f S16_LE -t raw - 2>/dev/null
end
