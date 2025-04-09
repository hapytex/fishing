function fromtemplate
    set tmpn "$argv[1]"
    set src "$fish_function_path[1]/templates/$tmpn"
    set -q "$argv[2]" || set to "$argv[1]" && set to "$argv[2]"
    natrix-env jinja2 -o "$to" -D "dirname="(basename (pwd)) -D "basename="(basename "$to") -- "$src" || cp "$src" "$to"
    cp --attributes-only -- "$src" "$to"
    git rev-parse --is-inside-work-tree >/dev/null 2>/dev/null && git add "$to"
    editor "$to"
end
