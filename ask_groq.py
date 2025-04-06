#!/usr/bin/python3

import sys

from groq import Groq

if __name__ == "__main__":
    argv = list(sys.argv)
    assert len(argv) > 1, "Need to provide the GROQ API key"
    if not sys.stdin.isatty():
        total = "".join(sys.stdin.readlines())
        argv.append(total)
    n = len(argv)
    assert n > 2, "Need to provide at least one prompt"
    roles = ("user",)
    if len(argv) > 3:
        roles = ("system", *(roles * (n - 3)))
    client = Groq(api_key=argv[1])
    completion = client.chat.completions.create(
        model="llama-3.3-70b-versatile",
        messages=[
            {"role": role, "content": prompt.strip()}
            for role, prompt in zip(roles, argv[2:])
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
