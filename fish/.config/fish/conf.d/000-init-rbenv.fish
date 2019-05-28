# add rbenv to if not in path.
if not set -q RBENV_ROOT; and test -d "$HOME/.rbenv"
    set -x $RBENV_ROOT "$HOME/.rbenv"
end

if test -z RBENV_ROOT
    set -l rbenv_path $RBENV_ROOT/bin
    if begin not contains $rbenv_path $fish_user_paths; and test -d $rbenv_path; end
        set -gxa fish_user_paths $rbenv_path
    end
end

# if not type -fq rbenv; and not contains "$RBENV_ROOT/bin" $PATH
#     set -x PATH $RBENV_ROOT/bin $PATH
# end
