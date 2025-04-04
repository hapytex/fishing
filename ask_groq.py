#!/usr/bin/python3

import sys

from groq import Groq

if __name__ == "__main__":
    assert len(sys.argv) > 1, "Need to provide the GROQ API key"
    assert len(sys.argv) > 2, "Need to provide at least one prompt"
    roles = ("user",)
    if len(sys.argv) > 3:
        roles = ("system", *(roles * (len(sys.argv) - 3)))
    client = Groq(api_key=sys.argv[1])
    completion = client.chat.completions.create(
        model="llama-3.3-70b-versatile",
        messages=[
            {"role": role, "content": prompt.strip()}
            for role, prompt in zip(roles, sys.argv[2:])
            if prompt
        ],
        temperature=1,
        max_completion_tokens=1024,
        top_p=1,
        stream=True,
        stop=None,
    )

    for chunk in completion:
        print(chunk.choices[0].delta.content or "", end="")
