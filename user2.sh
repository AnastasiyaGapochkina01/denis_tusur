#!/bin/bash

sudo sed -i 's/ADD_EXTRA_GROUPS=1/ADD_EXTRA_GROUPS=0/' /etc/adduser.conf

sudo addgroup --gid 2000 user2

sudo adduser --uid 2000 --gid 2000 --ingroup users --gecos "Пользователь 2,111,111-111," user2

sudo passwd user2
