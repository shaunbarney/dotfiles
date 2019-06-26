#!/usr/bin/env bash

mkdir ~/.zsh-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions