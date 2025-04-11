function groqquick --description 'Ask Groq something and read the result with quickread'
  groq $argv | quickread
end
