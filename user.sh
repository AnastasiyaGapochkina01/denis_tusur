#!/bin/bash

sudo groupadd -g 1500 user1

if ! getent group video; then
  sudo groupadd video
fi

sudo useradd -u 1500 -g 1500 -G video -m -d /home/user1 -s /bin/bash user1

sudo passwd --maxdays 60 --expire user1
