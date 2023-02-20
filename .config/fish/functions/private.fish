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
  yay -Syu
  sudo pacman -Qtdq | sudo pacman -Rns -
  yay -Yc
  yay -Ps
end

# Create a new directory and enter it
function mkd
  mkdir -pv $argv && cd $argv
end

# Git commit browser
function fshow
  set -l commit_hash "echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
  set -l view_commit "$commit_hash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"
  git log --color=always \
    --format="%Cred%h%Creset -%C(#f6c177)%d%Creset %s %Cgreen(%ar) %C(bold #c4a7e7)<%an>%Creset" $argv | \
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


function pomo
  # Armazena o primeiro argumento do usuário
  set val $argv[1]

  # Verifica se o valor é "work" ou não
  if test "$val" = "work"
    set duration "45m"
  else
    set duration "10m"
  end

  # Chama o comando "timer" com o tempo desejado
  timer $duration
end


function create
  mkdir -p $argv[1]
  touch "$argv[1]/$argv[2]"
end


# Anaconda fish integrate
function condafish
  $HOME/anaconda3/condabin/condafish init fish
end

# function pomodoro
#   # set pomo_options[work] "45"
#   # set pomo_options[break] "10"
#   set -g pomo_options $argv
#   set -g pomo_options ($argv == 'work')? '45' : '10'

#   # if [ (count $argv) -gt 0 ]

#   if [ (count $argv) -gt 0 -a (set -q pomo_options[$argv[1]]) ]
#     # set val $argv[1]
#     echo $val | lolcat
#     timer $(pomo_options[$val])m
#     # spd-say "$val session done"
#   end
# end


# function weather
#   set -l options (fish_opt -s s -l short)
#   set -l options (fish_opt -s n -l normal)
#   set -l options (fish_opt -s l -l large)
#   if $argv[2]
#     set -l $argv[2]
#     switch ($argv[2] | tr A-Z a-z)
#       case -s --short ''
#         curl 'wttr.in/?format=3'
#       case -n --normal
#         curl -s 'https://wttr.in/${}?m2F&format=v2'
#       case -f --full
#         curl -s 'https://wttr.in' | sed -n '1,27p'
#     end
#     return
#   end
#   curl 'wttr.in/?format=3'
# end
