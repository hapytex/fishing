#!/bin/bash

while read p; do
  url=$(cut -d ':' -f 2- <<<"$p")
  out=$(cut -d ':' -f 1 <<<"$p")
  echo "$url/$out"
  yt-dlp -f 251 "$url" -o - > temp.webm
  ffmpeg -i temp.webm -vn -ab 128k -ar 44100 -s "$mn" -t "$mx" -y "$out.mp3"
done
rm temp.webm
