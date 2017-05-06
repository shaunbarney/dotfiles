#!/usr/bin/env bash

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "install.sh" \
	--exclude "other/" --exclude "README.md" --exclude "LICENSE.txt" \
	-avh --no-perms . ~;
