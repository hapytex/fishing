function ... --description 'uses ... as an abbreviation of the git root'
    set -l root (git rev-parse --show-toplevel)
    or return

    if set -q argv[1]
      string replace '...' -- $root $argv
    else
      cd "$root"
    end
end
