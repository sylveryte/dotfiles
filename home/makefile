CONFIGPATH=$(CURDIR)/.config
HOST_CONFIGPATH=$(HOME)/.config

CONFIGS := \
			foot \
			nvim \
			yazi \
			fuzzel \
			ghostty \
			niri \
			systemd \
			waybar \
			sxiv \
			imv \
			helix \
			kitty \
			ytfzf \
			zathura \
			mako


.PHONY: link

link:
	mkdir -p $(HOST_CONFIGPATH)
	for cfg in $(CONFIGS); do \
			ln -sfn ${CONFIGPATH}/$$cfg $(HOST_CONFIGPATH)/$$cfg; \
	done
