# add rbenv to if not in path.
set -x RBENV_ROOT "$HOME/.rbenv"

if test -z "$RBENV_ROOT"
    set -x $RBENV_ROOT "$HOME/.rbenv"
end

if not type -fq rbenv; and not contains "$RBENV_ROOT/bin" $PATH
    set -x PATH $RBENV_ROOT/bin $PATH
end
