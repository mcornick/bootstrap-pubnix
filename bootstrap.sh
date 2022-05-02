#!/bin/sh -e
# SPDX-License-Identifier: CC0
prefix=$(dirname "$(dirname "$(which vim)")")
echo 'logout' > $HOME/.bash_logout
# shellcheck disable=SC2016
echo '. "$HOME/.bashrc"' > $HOME/.bash_profile
cp /dev/null $HOME/.hushlogin
echo 'set completion-ignore-case On' > $HOME/.inputrc
cat << E0F > $HOME/.bashrc
PS1="\\u@\\h:\\w\\\$ "
alias vi="vim"
export EDITOR="vim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LESS="MRc"
export PAGER="less"
export PATH="\$HOME/.local/bin:\$PATH"
export VISUAL="vim"
if [[ -f "$prefix/share/bash-completion/bash_completion" ]]; then
  . "$prefix/share/bash-completion/bash_completion"
fi
E0F
