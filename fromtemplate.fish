function fromtemplate -a tmpn -a to
    set src "$fish_function_path[1]/templates/$tmpn"
    test -n "$to" || set to "$tmpn"
    natrix-env jinja2 -o "$to" -D "dirname="(basename (/usr/bin/pwd)) -D "basename="(basename "$to") -- "$src" || cp "$src" "$to"
    cp --attributes-only -- "$src" "$to"
    git rev-parse --is-inside-work-tree >/dev/null 2>/dev/null && git add "$to"
    editor "$to"
end
