# dotfiles
my dev env

### vim

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl https://raw.githubusercontent.com/shelvinskyi/dotfiles/master/.vimrc \
    -o ~/.vimrc

then do `:PlugInstall` and `:LspInstallServer pylsp-all`
```

### venv

```
sudo apt install python3-venv
```

### tools

```
sudo apt install fd-find fzf tmux ripgrep
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
```

### tmux

```
mkdir -p ~/.tmux/plugins/ \
  && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm \
  && curl https://raw.githubusercontent.com/shelvinskyi/dotfiles/master/.tmux.conf -o ~/.tmux.conf
```
