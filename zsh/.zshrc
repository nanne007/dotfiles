export CLICOLOR=1

# More details, see https://stackoverflow.com/questions/444951/zsh-stop-backward-kill-word-on-directory-delimiter
autoload -U select-word-style
select-word-style bash

# .. instead of cd ..
setopt autocd

if [[ -z $ZPLUG_HOME ]]; then
    export ZPLUG_HOME=$HOME/.zplug
fi
source $ZPLUG_HOME/init.zsh
# Let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

oh_my_zsh_plugins=(
    docker
    docker-compose
    # mix
    # mix-fast
    # kubectl
    # kubernetes-helm
    golang
    zsh_reload
    colorize
    cargo
    rust
)
for plugin in $oh_my_zsh_plugins; do
    zplug "plugins/$plugin", from:oh-my-zsh
done

zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "themes/jnrowe", from:oh-my-zsh, as:theme


zplug "zsh-users/zsh-completions", from:github

zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2
zplug "zsh-users/zsh-history-substring-search", from:github, \
      defer:3
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

zplug "zlsun/solarized-man", from:github
zplug "qianxinfeng/vscode", from:github

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

export PATH=$HOME/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# git ignore cli
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# use linuxbrew
if [ "$(uname)" = "Linux" ]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

# # because in linux, rbenv is installed using linuxbrew
# # so the config should come after rbenv export path
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# # pyenv configuration
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# # java env configuration
# if which jenv > /dev/null; then eval "$(jenv init -)"; fi

if [ "$TERM" = "xterm" ]
then
    export TERM=xterm-256color
fi


alias emax="emacsclient -t"
if which emacsclient > /dev/null
then
    export EDITOR="emacsclient -t"
fi


export PATH=$HOME/.cargo/bin:$PATH


source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

if [ "$(uname)" = "Darwin" ]
then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

if [[ -z "$GOPATH" ]]
then
    export GOPATH=$HOME/go
    export GOBIN=$HOME/go/bin
    export PATH=$GOBIN:$PATH
fi

export GOPATH=$HOME/gospace:$GOPATH
