function proofread --description 'proofread a text from the stdin with Groq to find spelling and grammatical errors'
  groq 'you are given a text, find spelling and grammatical errors, and if room, add advice to rewrite the text to make it more clear'
end
