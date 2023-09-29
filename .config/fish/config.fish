## Environment Variables and Shell Behavior Configurations
## Custom Functions

set -x fish_ignore '^reboot$'

# Load private config
if test -e $HOME/.config/fish/functions/private.fish
    source $HOME/.config/fish/functions/private.fish
end

# PATH configurations
if test -f $HOME/.config/fish/exports/path.fish
  source $HOME/.config/fish/exports/path.fish
end

# Colors
if test -f $HOME/.config/fish/exports/colors.fish
  source $HOME/.config/fish/exports/colors.fish
end

# Other environment variables

set -x OPENAI_API_KEY (pass show job/chatgpt/api/token)
# set -x GITHUB_TOKEN (pass show github/api/token)

set FISH_DIR $HOME/.config/fish

# Editor
set -x EDITOR "nvim"
set -x VISUAL $EDITOR
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR "rvim -u NONE"

# Language
set -gx LANG en_US.utf8
set -gx LC_ALL en_US.utf8

# Fish
set -x SHELL /usr/bin/fish

# Bat
set -x BAT_THEME Catppuccin-mocha

# True color
set -gx COLORTERM truecolor

## General Fish Shell Configurations

# Completions configurations
# fish_update_completions

# Autosuggestions configurations
# fish_update_completions --autosuggestions
set -U fish_auto_suggestion on

# Fish key bindings
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_bind_mode insert

# Variables
set -gx GPG_TTY (tty)

# Keys binding
bind "^X\\x7f" backward-kill-line
bind -M insert \cg forget

# IEX Historic
set -x ERL_AFLAGS "-kernel shell_history enabled"

# Get OSTYPE
switch (uname)
  case Linux
    set -x OSTYPE Linux
  case Darwin
    set -x OSTYPE MacOS
  case FreeBSD NetBSD DragonFly
    set -x OSTYPE FreeBSD
  case '*'
    set -x OSTYPE unknown
end

# Git prompt
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_show_informative_status yes
set __fish_git_prompt_showupstream yes

# ASDF Version Manager
source /opt/asdf-vm/asdf.fish

## Theme and Appearance Configurations

# Colors configurations
# Fuzzy Finder
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# set -x EZA_COLORS "\
# uu=36:\
# gu=37:\
# sn=32:\
# sb=32:\
# da=34:\
# ur=34:\
# uw=35:\
# ux=36:\
# ue=36:\
# gr=34:\
# gw=35:\
# gx=36:\
# tr=34:\
# tw=35:\
# tx=36:"

# PLS-CLI
set -x PLS_ERROR_LINE_STYLE "#EBA0AC"
set -x PLS_ERROR_TEXT_STYLE "#F38BA8 bold"

set -x PLS_WARNING_LINE_STYLE "#F9E2AF"
set -x PLS_WARNING_TEXT_STYLE "#F9E2AF bold"

set -x PLS_UPDATE_LINE_STYLE "#A6E3A1"
set -x PLS_UPDATE_TEXT_STYLE "#A6E3A1 bold"

set -x PLS_INSERT_DELETE_LINE_STYLE "#CBA6F7"

set -x PLS_INSERT_DELETE_TEXT_STYLE "#9399B2"

set -x PLS_MSG_PENDING_STYLE "#9399B2"
set -x PLS_TABLE_HEADER_STYLE "#F5C2E7"
set -x PLS_TASK_DONE_STYLE "#9399B2"
set -x PLS_TASK_PENDING_STYLE "#CBA6F7"
set -x PLS_HEADER_GREETINGS_STYLE "#FAB387"
set -x PLS_QUOTE_STYLE "#9399B2"
set -x PLS_AUTHOR_STYLE "#9399B2"

set -x PLS_BACKGROUND_BAR_STYLE "bar.back"
set -x PLS_COMPLETE_BAR_STYLE "bar.complete"
set -x PLS_FINISHED_BAR_STYLE "bar.finished"

# Enable color output for specific commands
set -x LESS '-R'
set -x GREP_OPTIONS '--color=auto'

# Enable Automatic Command Suggestions
# set -x fish_greeting ""

# Custom Key Bindings

set bind $FISH_DIR/exports/bindings.fish
if test -f $bind
  source $bind
end

## Aliases and Shortcuts

# Main
if [ -f $HOME/.config/fish/aliases/main.fish ]
  source $HOME/.config/fish/aliases/main.fish
end

## Import Additional Files

# ENV
if [ -f $HOME/.config/fish/env/index.fish ]
  source $HOME/.config/fish/env/index.fish
end

# Git
if [ -f $HOME/.config/fish/aliases/git.fish ]
  source $HOME/.config/fish/aliases/git.fish
end

# Pomo CLI
if test -e $HOME/.config/fish/functions/pomo-cli.sh
    source $HOME/.config/fish/functions/pomo-cli.sh
end


## Scripts

# set -x BAT_THEME Dracula


# Colors for ls command
# set -gx LSCOLORS "Cxbgdxdxbxdgeghegeacad"


# Functions
# source $HOME/.functions


## ENV

#
### ALIAS
#


#
### GIT PROMPT CONFIGURATION
# See the file /usr/local/share/fish/functions/fish_git_prompt.fish
#

# set -l cl_empress 6c7086
# set -l cl_gainsboro f2cdcd
# set -l cl_dodger_blue 89b4fa
# set -l cl_gorse f6c177
# set -l cl_red_orange fab387
# set __fish_git_prompt_color_branch $cl_gorse -b $cl_empress
# set __fish_git_prompt_color_dirtystate $cl_dodger_blue -b $cl_gainsboro
# set __fish_git_prompt_color_invalidstate $cl_red_orange -b $cl_gainsboro
# set __fish_git_prompt_color_stagedstate $cl_dodger_blue -b $cl_gainsboro
# set __fish_git_prompt_color_cleanstate $cl_dodger_blue -b $cl_gainsboro
# set __fish_git_prompt_color_stashstate $cl_dodger_blue -b $cl_gainsboro
# set __fish_git_prompt_color_upstream $cl_gainsboro -b $cl_empress
# set __fish_git_prompt_color_untrackedfiles $cl_dodger_blue -b $cl_gainsboro
# set __fish_git_prompt_color $cl_gainsboro -b $cl_empress
#
# set __fish_git_prompt_char_cleanstate '  '
# set __fish_git_prompt_char_dirtystate '  '
# set __fish_git_prompt_char_invalidstate '  '
# set __fish_git_prompt_char_stagedstate '  '
# set __fish_git_prompt_char_stashstate '  '
# set __fish_git_prompt_char_stateseparator ' '
# set __fish_git_prompt_char_untrackedfiles '  '
# set __fish_git_prompt_char_upstream_ahead '  '
# set __fish_git_prompt_char_upstream_behind '  '
# set __fish_git_prompt_char_upstream_diverged '  '
# set __fish_git_prompt_char_upstream_equal '  '
# set __fish_git_prompt_char_upstream_prefix ' ' # 


# Prevent directories names from being shortened
# set fish_prompt_pwd_dir_length 0

# fish_prompt defined in ~/.config/fish/functions/fish_prompt.fish


# PATHS
# set -x PATH /usr/lib/lua/5.4/ $HOME/.npm-global/bin $TOOLBOX $HOME/.config/jdk-18.0.2.1/bin $HOME/.cargo/bin $HOME/.local/bin /usr/local/go $GOBIN /home/linuxbrew/.linuxbrew/bin $HOME/.gem/bin $PATH
# set -gx PATH $PATH /usr/lib/lua/5.4/ $HOME/.npm-global/bin $TOOLBOX $HOME/.config/jdk-18.0.2.1/bin $HOME/.cargo/bin $HOME/.local/bin /usr/local/go $GOBIN /home/linuxbrew/.linuxbrew/bin $HOME/.gem/bin $PATH

# if which asdf > /dev/null; status --is-interactive; and source (brew --prefix asdf)/asdf.fish; end


# export GPG_TTY=$(tty)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /home/araujo/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Cargo
# set -gx PATH $HOME/.cargo/bin $PATH

# pnpm
# set -gx PNPM_HOME "/home/araujo/.local/share/pnpm"
# if not string match -q -- $PNPM_HOME $PATH
#     set -gx PATH "$PNPM_HOME" $PATH
# end
# pnpm end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# bun
# set --export BUN_INSTALL "$HOME/.bun"
# set --export PATH $BUN_INSTALL/bin $PATH
# pls

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/araujo/.local/share/coursier/bin"
# <<< coursier install directory <<<

# Starship
starship init fish | source
# Zoxide cd alternative
zoxide init fish | source

