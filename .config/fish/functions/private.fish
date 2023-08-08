# Debian update/grade packages
function fup
  sudo apt update
  sudo apt upgrade
  brew update
  brew upgrade
  omf update
end

# Clean Debian unused packages
function apt-clean
  sudo apt-get clean
  sudo apt-get autoclean
  sudo apt-get autoremove
  sudo apt --fix-broken install
end

# Arch update
function upd
  sudo pacman -Syu
  paru -Syu
  sudo pacman -Qtdq | sudo pacman -Rns -
  paru -Yc
  paru -Ps
end

# Create a new directory and enter it
function mkd
  mkdir -pv $argv[1]; and cd $argv[1]
end

# Git
function gint
  set message $argv

  if ! test -d .git
    set message "initial commit"
    git init
  end

  git add .
  set message "chore: commit save point"
  git commit -m $message
  git checkout -b dev
end

# Git commit browser
function fshow
  set -l commit_hash "echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
  set -l view_commit "$commit_hash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"
  git log --color=always \
    --format="%Cred%h%Creset -%C(#f9e2af)%d%Creset %s %Cgreen(%ar) %C(bold #cba6f7)<%an>%Creset" $argv | \
  fzf --no-sort --tiebreak=index --no-multi --reverse --ansi \
    --header="enter to view, alt-y to copy hash" --preview="$view_commit" \
    --bind="enter:execute:$view_commit | less -R" \
    --bind="alt-y:execute:$commit_hash | xclip -selection clipboard"
end

# Print README file
function readme
  # set -l mdvp '/home/linuxbrew/.linuxbrew/lib/python3.10/site-packages/mdv/markdownviewer.py'
  for readme in {readme,README}.{md,MD,markdown,mkd,txt,TXT}
    if [ -x $(command -v glow) ]; and [ -f $readme ]
      mdv $readme
    else if [ -f $readme ]
      cat $readme
    end
  end
end

# Weather
function sweather
  curl 'wttr.in/?format=3'
end

function weather
  curl -s 'https://wttr.in/${}?m2F&format=v2'
end

function fweather
  curl -s 'https://wttr.in' | sed -n '1,27p'
end


function pomodoro
  # Armazena o primeiro argumento do usuário
  set val $argv
  set duration "5s"

  # Verifica se o valor é "work" ou não
  if test "$val" = "work"
    set duration "45m"
  end

  # Chama o comando "timer" com o tempo desejado
  clear
  echo $argv
  timer $duration -n "$argv "
  paplay $HOME/Music/windowsphone-ringtone.mp3
  echo $val "session done. "
end

# PHP
function server
  php -S localhost:$argv[1] $argv[2] $argv[3]
end

# Change directories and view the contents at the same time
function j
    set -l DIR $argv

    # if no DIR given, go home
    if test (count $argv) -lt 1
        set DIR $HOME
    end

    # builtin cd $DIR; and \
    z $DIR
    clear
    # use your preferred ls command
end

# Anaconda fish integrate
function condafish
  $HOME/anaconda3/condabin/condafish init fish
end

