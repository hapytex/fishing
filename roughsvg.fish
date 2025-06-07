function roughsvg --description ''
  set hm (fish_home)
  cd "$hm/rough"
  node src/svg2roughjs.js $argv
end
