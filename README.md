# Setup Steps
## install and enable plasma tiling like dwm 
https://github.com/esjeon/krohnkite
### hide borders 
system settings -> application style -> window decoration -> edit breeze -> window specific -> add new rule -> window title -> ".*" -> border tiny 

## install oh my zsh
https://github.com/ohmyzsh/ohmyzsh

### install zsh syntax highlighting & autosuggestions
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
#### using ohmyzsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

note : might wanna relink .zshrc

#### install powerlevel10k`
https://github.com/romkatv/powerlevel10k#oh-my-zsh

### update mirrorlist
sudo reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# linux help
## rsync
* rsync -chavzzP --stats user@remote:/file/from /local/to
* https://explainshell.com/explain?cmd=rsync+-chavzP+--stats+user%40remote.host%3A%2Fpath%2Fto%2Fcopy+%2Fpath%2Fto%2Flocal%2Fstorage
