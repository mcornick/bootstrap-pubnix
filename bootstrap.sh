#!/bin/sh -e
# SPDX-License-Identifier: CC0
prefix=$(dirname "$(dirname "$(which vim)")")
touch "$HOME/.bashrc.local" "$HOME/.bash_profile.local"
echo 'clear' > "$HOME/.bash_logout"
printf ". \"\$HOME/.bashrc\"\n. \"\$HOME/.bash_profile.local\"\n" > "$HOME/.bash_profile"
echo 'set completion-ignore-case On' > "$HOME/.inputrc"
cat << E0F > "$HOME/.bashrc"
set -o emacs
PS1="\\u@\\h:\\w\\\$ "
alias vi="vim"
export EDITOR="vim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LESS="FXMRc"
export PAGER="less"
export PATH="\$HOME/.local/bin:\$PATH"
export TZ="America/New_York"
export VISUAL="vim"
if [[ -f "$prefix/share/bash-completion/bash_completion" ]]; then
  . "$prefix/share/bash-completion/bash_completion"
fi
case "\$TERM" in
xterm*)
  PROMPT_COMMAND='echo -ne "\033]0;\${USER}@\${HOSTNAME}:\${PWD}\007"'
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
set hidden
set history=1000
set ignorecase
set incsearch
set laststatus=2
set modeline
set mouse=a
set nrformats-=octal
set pastetoggle=<leader>p
set ruler
set scrolloff=1
set sessionoptions-=options
set sidescrolloff=5
set smartcase
set smarttab
set statusline=%f\ %m\ %r\ %=\ %y\ %l,%c
set tabpagemax=50
set ttimeout
set ttimeoutlen=100
set viewoptions-=options
set wildmenu
autocmd BufRead,BufNewFile *.md set filetype=markdown textwidth=72
autocmd BufRead,BufNewFile *.mdoc set filetype=nroff
autocmd FileType python setlocal completeopt-=preview textwidth=79
nnoremap <SPACE> <Nop>
let mapleader=" "
source ~/.vimrc.local
E0F
touch "$HOME/.vimrc.local"
cat << E0F > "$HOME/.tmux.conf"
unbind C-b
set-option -g prefix C-a
bind C-a send-prefix
set-option -g status-right "#(whoami)@#(hostname -s) %X %x"
set -g status-right-length 50
set -g status-left-length 20
set -s escape-time 0
set -g history-limit 50000
set -g display-time 4000
set -g status-interval 5
set -g default-terminal "screen-256color"
set -g status-keys emacs
set -g focus-events on
setw -g aggressive-resize on
source-file ~/.tmux.conf.local
E0F
touch "$HOME/.tmux.conf.local"
git config --global branch.autosetupmerge 'true'
git config --global color.ui 'auto'
git config --global core.autocrlf 'input'
git config --global core.editor 'vim'
# shellcheck disable=SC2088
git config --global core.excludesfile '~/.gitignore_global'
git config --global diff.mnemonicprefix 'true'
git config --global init.defaultBranch 'main'
git config --global pull.rebase 'false'
git config --global push.default 'current'
git config --global push.followTags 'true'
git config --global rerere.enabled 'true'
git config --global user.email 'mcornick@mcornick.com'
git config --global user.name 'Mark Cornick'
