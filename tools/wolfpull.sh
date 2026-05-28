#! /bin/sh
#
# wolfpull.sh
# Copyright (C) 2020 sylveryte <sylveryte@archred>
#
# Distributed under terms of the MIT license.
#


# sync -aP -e "ssh -p 8022" $(nmap -sn 192.168.43.133/24 | grep -P '192.168.43.(?!133\b)\d{1,3}'):~/sdcard/push/ ~/linuxdata/wolfexchange/pull

IP=$(nmap -sn 192.168.43.133/24 | grep -P '192.168.43.(?!133\b)\d{1,3}' -o)
echo "hola $IP"
