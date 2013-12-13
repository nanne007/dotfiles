**一些常用的配置文件，包括 gitconfig, gemrc, sublime preferences.**

### How to Use

``` shell
cd ~/
git clone https://github.com/funfriend/dotfiles.git .dotfiles
# link files
ln -sf .dotfiles/gemrc .gemrc
ln -sf .dotfiles/gitconfig .gitconfig
ln -sf .dotfiles/sbtconfig .sbtconfig

ln -sf .dotfiles/oh-my-zsh .oh-my-zsh
ln -sf .dotfiles/zshrc .zshrc

# link sublime-text user preferences
cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages

ln -sf ~/.dotfiles/sublime/user User
```
