DBOX_HOME=$(CURDIR)/../home

.PHONY: setup

setup:
	podman build -t devbox .
	distrobox-create --image devbox --home $(DBOX_HOME) devbox
