function roughsvg --description 'convert a given .svg file to its roughjs equivalent'
  set hm (fish_home)
  cd "$hm/rough"
  node src/svg2roughjs.js $argv
end
