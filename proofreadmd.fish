function proofreadmd --description 'proofread Markdown files with Groq to find spelling and grammatical errors'
  for item in $argv;
    groq 'you are given a text in English in Markdown, find spelling and grammatical errors, and if room, add advice to rewrite the text to make it more clear. If nothing should be rewritten, just say OK' < "$item" | tee -a "$item.proofread" | quickread
  end
end
