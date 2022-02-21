#! /bin/bash

d0=$(cd $(dirname $0)/.. && pwd)

# Creating ssh key
if test ! -e ~/.ssh/id_rsa; then
	ssh-keygen -t rsa -b 8192
fi


# Registering authorized_keys
cat $d0/setup-private/authorized_keys > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
