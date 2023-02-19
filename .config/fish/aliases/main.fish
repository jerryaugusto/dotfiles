#Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
# alias ~='cd ~'
# alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'

# Easy report
alias exa='exa --classify --icons --color=always --all --group-directories-first --header'
alias ls='exa'
alias la='exa --grid --all'
alias ld='exa --only-dirs --all'
# These options are available when running with --long (-l)
alias ll='exa --long --all'
alias lg='exa --git --git-ignore --long --all'

alias fdir='find . -type d -name'
alias ff='find . -type f -name'
alias rm='rm -i'
alias rmf='rm -rf'
alias free='free -h'
alias disk='df -h | grep sd \
    | sed -e "s_/dev/sda[1-9]_\x1b[34m&\x1b[0m_" \
    | sed -e "s_/dev/sd[b-z][1-9]_\x1b[33m&\x1b[0m_" \
    | sed -e "s_[,0-9]*[MG]_\x1b[36m&\x1b[0m_" \
    | sed -e "s_[0-9]*%_\x1b[32m&\x1b[0m_" \
    | sed -e "s_9[0-9]%_\x1b[31m&\x1b[0m_" \
    | sed -e "s_/mnt/[-_A-Za-z0-9]*_\x1b[34;1m&\x1b[0m_"'
alias preview='fzf --height=50% --layout=reverse --preview="bat --color=always {}"'

# Bookmarks
alias dl='cd ~/Downloads && exa --long --all'
alias doc='cd ~/Documents && exa --long --all'
alias space='cd ~/workspace && exa --long --all'
alias dfs='cd ~/dotfiles && clear && lg'

#Shortcuts
alias :q='exit'
alias cat='bat'
alias vim='lvim'
# alias pomo='pomo.sh'

alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'

alias mp3-dl='yt-dlp --ignore-config --extract-audio \
    --audio-format "mp3" --audio-quality 0 --embed-thumbnail --embed-metadata \
    --output "$HOME/Downloads/%(title)s.%(ext)s"'

alias mp4-dl='youtube-dl --ignore-config --format best --embed-thumbnail \
    --add-metadata --metadata-from-title "%(artist)s - %(title)s" \
    --output "$HOME/Videos/%(title)s.%(ext)s"'

# alias wezterm='flatpak run org.wezfurlong.wezterm'
