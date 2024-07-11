function fromtemplate
    set tmpn "$argv[1]"
    set src "$fish_function_path[1]/templates/$tmpn"
    set -q "$argv[2]" || set to "$argv[1]" && set to "$argv[2]"
    cp "$src" "$to"
    git rev-parse --is-inside-work-tree >/dev/null 2>/dev/null && git add "$to"
    editor "$to"
end
