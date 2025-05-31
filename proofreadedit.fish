function proofreadedit --description 'let vim open the file along with the proofread file'
 for f in **/*.proofread; do
  d=$(dirname "$f")
  b=$(basename "$f" '.proofread')
  b="$d/$b"
  sh1=$(sha384sum "$b")
  vim -p "$f" "$b"
  sh2=$(sha384sum "$b")
  if [ "$sh1" != "$sh2" ]; then
    echo "Assume we fixed $b"
    rm "$f"
  fi
 done
end
