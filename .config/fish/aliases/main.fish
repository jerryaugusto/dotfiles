#Navigation
alias .. 'cd ..'
alias ... 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'
alias .5 'cd ../../../../..'
# alias ~ 'cd ~'
# alias -- - 'cd -'
alias 1 'cd -'
alias 2 'cd -2'
alias 3 'cd -3'
alias 4 'cd -4'
alias 5 'cd -5'

# Easy report
alias ls 'lsd'

alias l 'ls -l'
alias la 'ls -a'
alias lla 'ls -la'
alias lt 'ls --tree'
alias ld 'exa --only-dirs --icons --group-directories-first --header --all'
alias lg 'exa --git --git-ignore --icons --group-directories-first --header --long --all'

alias fdir 'find . -type d -name'
alias ff 'find . -type f -name'
alias rm 'rm -i'
alias rmf 'rm -rf'
alias free 'free -h'
alias du 'du -sh'
alias disk 'df -h | grep sd \
    | sed -e "s_/dev/sda[1-9]_\x1b[34m&\x1b[0m_" \
    | sed -e "s_/dev/sd[b-z][1-9]_\x1b[33m&\x1b[0m_" \
    | sed -e "s_[,0-9]*[MG]_\x1b[36m&\x1b[0m_" \
    | sed -e "s_[0-9]*%_\x1b[32m&\x1b[0m_" \
    | sed -e "s_9[0-9]%_\x1b[31m&\x1b[0m_" \
    | sed -e "s_/mnt/[-_A-Za-z0-9]*_\x1b[34;1m&\x1b[0m_"'
alias preview 'fzf --height=50% --layout=reverse --preview="bat --color=always {}"'

# Dev tolls
alias pm 'pnpm'
alias yolo 'rm -rf node_modules/ && rm package-lock.json && pm install'
alias playground 'cd ~/workstation/playground/ && lsd -a'
alias study 'cs ~/workstation/study/ && lsd -a'

# alias break 'pomo break'
alias work 'pomo work'
# alias -g G '| ripgrep'

# Bookmarks
alias dl 'cd ~/Downloads && exa --long --all'
alias doc 'cd ~/Documents && lsd -la'
alias space 'cd ~/workspace && lsd -la'
alias dfs 'cd ~/dotfiles && clear && lg -G'

#Shortcuts
alias :q 'exit'
# alias pls "please"
alias sudoedit "pleaseedit"
alias cat 'bat'
alias vim 'nvim'
# alias pip 'pip3'
alias af 'asdf'
alias ranger 'joshuto'
# alias pomo 'pomo.sh'

alias copy 'xclip -selection clipboard'
alias paste 'xclip -selection clipboard -o'

alias mp3-dl 'yt-dlp --ignore-config --extract-audio \
    --audio-format "mp3" --audio-quality 0 --embed-thumbnail --embed-metadata \
    --output "$HOME/Downloads/%(title)s.%(ext)s"'

alias mp4-dl 'yt-dlp --ignore-config --format best --embed-thumbnail \
    --add-metadata --metadata-from-title "%(artist)s - %(title)s" \
    --output "$HOME/Videos/%(title)s.%(ext)s"'

# alias wx-config 'wx-config-gtk2'

alias reload 'source ~/.config/fish/aliases/main.fish'

# alias wezterm 'flatpak run org.wezfurlong.wezterm'
