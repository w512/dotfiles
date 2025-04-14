```
brew install stow

git clone git@github.com:w512/dotfiles.git

cd dotfiles/

stow -t ~ .
```

## Installing tmux plugins

##### 1. Install TPM:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
##### 2. Now reload your tmux config (inside tmux):
```
tmux source ~/.tmux.conf
```
##### 3. Install the plugins
Press: prefix (usually Ctrl+b) + I (capital i)

→ TPM will fetch and install all the plugins listed.
