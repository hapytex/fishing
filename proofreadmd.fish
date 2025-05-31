function proofreadmd --description 'proofread Markdown files with Groq to find spelling and grammatical errors'
  for item in $argv;
    if ! test -f "$item.proofread"
      echo -e "Reading \e[33m\e[1m$item\e[0m"
      groq 'you are given a text in English in Markdown, find spelling and grammatical errors, and if room, add advice to rewrite the text to make it more clear. If nothing should be rewritten, just say OK' < "$item" | tee -a "$item.proofread" | quickread || rm "$item.proofread"
      #
    else
      echo -e "Already got a .proofread: \e[32m\e[1m$item\e[0m"
    end
  end
end
