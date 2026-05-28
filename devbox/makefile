HOME=/home/${USER}/sylveryte/dotfiles/home/

.PHONY setup

setup:
	podman build -t devbox .
	distrobox-create --image devbox --home $(pwd)/../home/ devbox
