if test -d "$HOME/lib/ruff"
    set -l ruff_path $HOME/lib/ruff/bin
    if begin not contains $ruff_path $fish_user_paths; and test -d $ruff_path; end
        set -gxa fish_user_paths $ruff_path
    end
end
