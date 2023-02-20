set -U fish_auto_suggestion off

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Fix pulseaudio bug
# systemctl --user --now enable pulseaudio.service pulseaudio.socket

starship init fish | source

# Zoxide cd alternative
zoxide init fish | source

if test -e $HOME/.config/fish/exports/path.fish
  source $HOME/.config/fish/exports/path.fish
end

if test -e $HOME/.config/fish/functions/pomo-cli.sh
  source $HOME/.config/fish/functions/pomo-cli.sh
end

# if test -e $HOME/miniconda3/condabin/conda
#   source $HOME/miniconda3/condabin/conda
# end

# Language
set -gx LANG en_US.utf8
set -gx LC_ALL en_US.utf8

# Fish
set -x SHELL /usr/bin/fish

# Bat
set -x BAT_THEME Dracula

# Load private config
if test -e $HOME/.config/fish/private.fish
    source $HOME/.config/fish/private.fish
end

# Colors for ls command
# set -gx LSCOLORS "Cxbgdxdxbxdgeghegeacad"

# Keys binding
bind "^X\\x7f" backward-kill-line
bind -M insert \cg forget

# Fish key bindings
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_bind_mode insert

# True color
set -gx COLORTERM truecolor

# Editor
set -x EDITOR nvim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR "rvim -u NONE"

# Functions
# source $HOME/.functions

switch (uname)
case Linux
    set -x OSTYPE "Linux"
case Darwin
    set -x OSTYPE "MacOS"
case FreeBSD NetBSD DragonFly
    set -x OSTYPE "FreeBSD"
case '*'
    set -x OSTYPE "unknown"
end

## ENV

if [ -f $HOME/.config/fish/env/index.fish ]
    source $HOME/.config/fish/env/index.fish
end

#
### ALIAS
#
# Main
if [ -f $HOME/.config/fish/aliases/main.fish ]
    source $HOME/.config/fish/aliases/main.fish
end

# Git
if [ -f $HOME/.config/fish/aliases/git.fish ]
    source $HOME/.config/fish/aliases/git.fish
end

#
### GIT PROMPT CONFIGURATION
# See the file /usr/local/share/fish/functions/fish_git_prompt.fish
#
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showupstream 'yes'

set -l cl_empress '403d52'
set -l cl_gainsboro 'ebbcba'
set -l cl_dodger_blue '9ccfd8'
set -l cl_gorse 'f6c177'
set -l cl_red_orange 'eb6f92'
set __fish_git_prompt_color_branch $cl_gorse -b $cl_empress
set __fish_git_prompt_color_dirtystate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_invalidstate $cl_red_orange -b $cl_gainsboro
set __fish_git_prompt_color_stagedstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_cleanstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_stashstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_upstream $cl_gainsboro -b $cl_empress
set __fish_git_prompt_color_untrackedfiles $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color $cl_gainsboro -b $cl_empress

set __fish_git_prompt_char_cleanstate '  '
set __fish_git_prompt_char_dirtystate '  '
set __fish_git_prompt_char_invalidstate '  '
set __fish_git_prompt_char_stagedstate '  '
set __fish_git_prompt_char_stashstate '  '
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_untrackedfiles '  '
set __fish_git_prompt_char_upstream_ahead '  '
set __fish_git_prompt_char_upstream_behind '  '
set __fish_git_prompt_char_upstream_diverged '  '
set __fish_git_prompt_char_upstream_equal '  '
set __fish_git_prompt_char_upstream_prefix ' ' # 

# Fuzzy Finder
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
--color=fg:#e0def4,bg:#1f1d2e,hl:#6e6a86 \
--color=fg+:#908caa,bg+:#191724,hl+:#908caa \
--color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7 \
--color=marker:#ebbcba,spinner:#eb6f92,header:#ebbcba"

# Onedark
# if status is-interactive
#     set -l onedark_options '-b'

#     if set -q VIM
#         # Using from vim/neovim.
#         set onedark_options "-256"
#     else if string match -iq "eterm*" $TERM
#         # Using from emacs.
#         function fish_title; true; end
#         set onedark_options "-256"
#     end

#     set_onedark $onedark_options
# end

#
### PROMPT
#

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

# fish_prompt defined in ~/.config/fish/functions/fish_prompt.fish

# IEX Historic
set -x ERL_AFLAGS "-kernel shell_history enabled"

# PATHS
# set -x PATH /usr/lib/lua/5.4/ $HOME/.npm-global/bin $TOOLBOX $HOME/.config/jdk-18.0.2.1/bin $HOME/.cargo/bin $HOME/.local/bin /usr/local/go $GOBIN /home/linuxbrew/.linuxbrew/bin $HOME/.gem/bin $PATH
# set -gx PATH $PATH /usr/lib/lua/5.4/ $HOME/.npm-global/bin $TOOLBOX $HOME/.config/jdk-18.0.2.1/bin $HOME/.cargo/bin $HOME/.local/bin /usr/local/go $GOBIN /home/linuxbrew/.linuxbrew/bin $HOME/.gem/bin $PATH

# if which asdf > /dev/null; status --is-interactive; and source (brew --prefix asdf)/asdf.fish; end

# Variables
set -gx GPG_TTY (tty)

# export GPG_TTY=$(tty)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/araujo/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

