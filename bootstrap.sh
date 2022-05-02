#!/bin/sh -e
# SPDX-License-Identifier: CC0
prefix=$(dirname $(dirname $(which vim)))
echo 'logout' > .bash_logout
echo '. "$HOME/.bashrc"' > .bash_profile
cp /dev/null .hushlogin
echo 'set completion-ignore-case On' > .inputrc
cat << E0F > .bashrc
PS1="\\u@\\h:\\w\\\$ "
alias vi="vim"
export EDITOR="vim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LESS="MRc"
export PAGER="less"
export PATH="\$HOME/.local/bin:\$PATH"
export VISUAL="vim"
if [[ -f "$prefix/share/bash-completion/bash_competion" ]]; then
  . "$prefix/share/bash-completion/bash_competion"
fi
E0F
