#!/bin/bash

yy=$(date '+%Y')

while [ "$#" -gt 0 ]; do
  nm="$1"
  album=$(basename "$nm" '.txt' | sed 's/[_ -]+/ /g')
  n=$(wc -l < "$nm")
  i=1
  while read p; do
    url=$(cut -d ':' -f 2- <<<"$p")
    out=$(cut -d ':' -f 1 <<<"$p")
    echo "$url/$out"
    yt-dlp -f 251 "$url" -o - > temp.webm
    ffmpeg -i temp.webm -vn -ab 128k -ar 44100 -y "$out.mp3" </dev/null
    nn=$(sed 's/[_ -]+/ /g' <<<"$out")
    id3v2 -t "$nn" -g 31 -T "$i/$n" -A "$album" -a "$album" -y "$yy" "$out.mp3"
    i=$((i+1))
  done < "$nm"
  shift
done
rm temp.webm
