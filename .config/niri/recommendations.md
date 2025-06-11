# Recommendation

- Read niri wikis
- Read waybar wikis
- Keybind
- `wev` to find keybinds
- `camorama` to control webcam
- `cliphist` for clipboard management
- `swayidle`
- `nm-applet`
- `gnome-polkit`
- Screenshot
  - instead of flameshot we'll use `grim -g "$(slurp)" - | swappy -f -`
    - instead of swappy we'll use satty `grim -g "$(slurp)" - | satty -f -`
  * `flameshot` screenshot use `XDG_CURRENT_DESKTOP=Sway flameshot gui` command
  * also `satty` can help with annotations of existing file
    use `--copy-command wl-copy`

## Fedora / common

```sh
sudo dnf install fontawesome-fonts-all, brightnessctl, network-manager-applet, pasystray
```
