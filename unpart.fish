function unpart --description 'look for parts with a corresponding file'
  find -type f -iname '*.part' | while read p
    set dn (dirname "$p")
    set bn (basename "$p" '.part')
    if [ -f "$dn/$bn" ]
      echo "$dn/$bn"
    end
  end
end
