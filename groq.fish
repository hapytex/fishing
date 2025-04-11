function groq --description 'Ask Groq something' -a name
  assets /usr/bin/python3 ../ask_groq.py (setvar GROQ_API_TOKEN) $argv
end
