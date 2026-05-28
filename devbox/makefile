HOME=/home/${USER}/sylveryte/dotfiles/home/

.PHONY setup

setup:
	podman build -t devbox .
	distrobox-create --image devbox --home /home/${USER}/sylveryte/dotfiles/home/ devbox
