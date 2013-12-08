#!/bin/bash
 
USERS="admin u1 u2 u3 u4 u5 u6"
 
for GITOLITE_USER in $USERS; do
	ssh-keygen -q -N '' -f "${HOME}/.ssh/${GITOLITE_USER}"
 	cat <<EOF >> "${HOME}/.ssh/config"
Host $GITOLITE_USER
	User git
	HostName localhost
	StrictHostKeyChecking no
	IdentityFile ~/.ssh/${GITOLITE_USER}
EOF
done
