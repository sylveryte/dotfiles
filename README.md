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

## tips

### enable polkit for mount from fms
``` https://wiki.archlinux.org/index.php/PCManFM#%22Not_authorized%22_error_when_attempting_to_mount_drive ```

### enable hibernate 
```https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation ```

* use refind
* del to hide entry
* refind theme
```https://github.com/bobafetthotmail/refind-theme-regular ```

### lock hooks on lid close/hibernation
* use /etc/systemd/system/suspend@sylveryte.service in system dir, one is enough sleep is enough
``` https://wiki.archlinux.org/index.php/Power_management#Sleep_hooks ```
```
Unit]
Description=User suspend actions
Before=sleep.target

[Service]
User=%I
Type=forking
Environment=DISPLAY=:0
ExecStartPre=
ExecStart=/usr/bin/sh "/home/sylveryte/myscripts/scrlock.sh"
ExecStartPost=/usr/bin/sleep 1

[Install]
WantedBy=sleep.target
```


### last20
expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20

### battery and time , alias in zsh acpi required
kwolski-analysis

### configure redshift
redshift -P  -l 18.9398187769194:72.8355252742767

### alpha wallpaper
paastry iamfake @mailinator.com
apikey bbf152f0da46437b72c4bc01cccb0c84

### vimtips
:%s/foo/bar/g #replace all
:%s/foo/bar/cg #replace all interactively
:6,10s/foo/bar/g #replace form 6 to 10

### silly apps
lolcat sl gti cmatrix figlet cowsay jp2a

### fonts
install nerdfont complete
search fonts with fc-list | grep 'font name'
termite-styl

### image quick edits 
gwenview
### images tiling
sxiv
### browser
qutebrowser

### image compression
mogrify -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB *.jpg *.JPG *.jpeg

### git cherry pick cherry-pick
git cherry-pick --strategy=recursive -X ours 84ed49329

### favicon generation 
https://realfavicongenerator.net/

### git conflicts
git config --global alias.conflicts "diff --name-only --diff-filter=U"

### hq pixlated png img
mogrify -format png -scale 1% -scale 5000% *.jpg

### blur reduction
convert -strip -interlace Plane -scale 1% -gaussian-blur 15  -quality 1% source.jpg dest.png

### negativs
mogrify -strip -interlace Plane -gaussian-blur 5 -negate *.jpg

### make thumb them transparent
mogrify -format png -fill "#0000" +opaque none *.jpg 
mogrify -path lowquality/ -format png -fill "#0000" +opaque none thumbnails/*

### make blank png 
convert -size 1x1 xc:"rgba(0,0,0,0)" PNG32:proxy.png

### search in all files
grep -rnw ../.. -e 'namespace'

###  for vue language support in vim 
https://www.npmjs.com/package/vue-language-server

###  archred swap 
Setting up swapspace version 1, size = 8 GiB (8589930496 bytes)
no label, UUID=1a33f401-0e75-4537-890c-7b7c5535028c

###  mpd notification
https://wiki.archlinux.org/index.php/Music_Player_Daemon/Tips_and_tricks#mpd-notification

## nmap find connected devices
sudo nmap -sn 192.168.1.0/24

## create image pdf
img2pdf -o j.pdf *.jpg  -s 500x700
