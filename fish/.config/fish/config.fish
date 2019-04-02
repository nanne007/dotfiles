# auto install fisher package manager
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# change fisher installation prefix
set -g fisher_path $HOME/.config/fish/fisher

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end


if test -d $HOME/bin
    set -x PATH $HOME/bin $PATH
end

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

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -x _DEFAULT_PROXY "http://127.0.0.1:1087"
alias proxy="set -x -g ALL_PROXY $_DEFAULT_PROXY; set -x -g HTTP_PROXY $_DEFAULT_PROXY; set -x -g HTTPS_PROXY $_DEFAULT_PROXY"
alias unproxy="set -e ALL_PROXY; and set -e HTTP_PROXY; and set -e HTTPS_PROXY"

# see https://lug.ustc.edu.cn/wiki/mirrors/help/rust-static for more details
set -x RUSTUP_DIST_SERVER "https://mirrors.ustc.edu.cn/rust-static"
set -x RUSTUP_UPDATE_ROOT "https://mirrors.ustc.edu.cn/rust-static/rustup"

