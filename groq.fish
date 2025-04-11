function groq --description 'Ask Groq something' -a name
  fish_home natrix ask_groq.py (setvar GROQ_API_TOKEN) $argv
end
