#!/bin/sh -e
# SPDX-License-Identifier: CC0
prefix=$(dirname "$(dirname "$(which vim)")")
touch "$HOME/.bashrc.local"
echo 'logout' > "$HOME/.bash_logout"
echo 'logout' > "$HOME/.zlogout"
# shellcheck disable=SC2016
echo '. "$HOME/.bashrc"' > "$HOME/.profile"
echo 'set completion-ignore-case On' > "$HOME/.inputrc"
cat << E0F > "$HOME/.bashrc"
PS1="\\u@\\h:\\w\\\$ "
alias tmux="tmux attach || tmux"
alias vi="vim"
export EDITOR="vim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LESS="MRc"
export PAGER="less"
export PATH="\$HOME/.local/bin:\$PATH"
export TZ="America/New_York"
export VISUAL="vim"
if [[ -f "$prefix/share/bash-completion/bash_completion" ]]; then
  . "$prefix/share/bash-completion/bash_completion"
fi
case "\$TERM" in
xterm*)
  PROMPT_COMMAND='echo -ne "\033]0;\${USER}@\${HOSTNAME}: \${PWD}\007"'
  ;;
*)
  ;;
esac
. "\$HOME/.bashrc.local"
E0F
cat << E0F > "$HOME/.vimrc"
filetype plugin indent on
syntax enable
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set complete-=i
set display+=lastline
set encoding=utf-8
set formatoptions+=j
set history=1000
set incsearch
set laststatus=2
set nrformats-=octal
set ruler
set scrolloff=1
set sessionoptions-=options
set sidescrolloff=5
set smarttab
set tabpagemax=50
set ttimeout
set ttimeoutlen=100
set viewoptions-=options
set wildmenu
E0F
cat << E0F > "$HOME/.zshrc"
PS1="%n@%m:%~:%# "
HISTFILE=\$HOME/.zsh_history
HISTSIZE=2000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
alias tmux="tmux attach || tmux"
alias vi="vim"
export EDITOR="vim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LESS="MRc"
export PAGER="less"
export PATH="\$HOME/.local/bin:\$PATH"
export TZ="America/New_York"
export VISUAL="vim"
case "\$TERM" in
xterm*)
  PROMPT_COMMAND='echo -ne "\033]0;\${USER}@\${HOSTNAME}: \${PWD}\007"'
  ;;
*)
  ;;
esac
. "\$HOME/.bashrc.local"
E0F
