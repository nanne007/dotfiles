# add rbenv to if not in path.
if not set -q RBENV_ROOT; and test -z "$HOME/.rbenv"
    set -x $RBENV_ROOT "$HOME/.rbenv"
end

if not type -fq rbenv; and not contains "$RBENV_ROOT/bin" $PATH
    set -x PATH $RBENV_ROOT/bin $PATH
end
