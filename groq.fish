function groq --description 'Ask groq something' -a name
  set pth (/usr/bin/pwd)
  cd (assets)
  /usr/bin/python3 ../ask_groq.py (setvar GROQ_API_TOKEN) $argv
  cd "$pth"
end
