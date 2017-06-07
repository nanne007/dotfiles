set PATH $HOME/.cargo/bin $PATH

set -xg EDITOR 'emacsclient -nw'
abbr -a emax emacsclient -nw

abbr -a bi bundle install
abbr -a bu bundle update
abbr -a be bundle exec
abbr -a bl bundle list
abbr -a bo bundle open
abbr -a bcn bundle clean


set -x GOPATH $HOME/.go
set -x GOBIN $GOPATH/bin
set -x PATH $GOBIN $PATH
