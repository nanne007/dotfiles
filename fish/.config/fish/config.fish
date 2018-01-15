if test -d $HOME/.cargo
    set -x PATH $HOME/.cargo/bin $PATH
end

if test -d $HOME/go
    set -x GOPATH $HOME/go
    if test ! -d $GOPATH/bin
        command mkdir -p $GOPATH/bin
    end
    set -x GOBIN $GOPATH/bin
    set -x PATH $GOBIN $PATH
end

set -x EDITOR 'emacsclient -nw'
abbr -a emax emacsclient -nw

abbr -a bi bundle install
abbr -a bu bundle update
abbr -a be bundle exec
abbr -a bl bundle list
abbr -a bo bundle open
abbr -a bcn bundle clean


if test (uname) = "Darwin"
    set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
end
