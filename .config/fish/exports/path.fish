# PATHs

# Bin
if test -e $HOME/.local/bin
  set -gx PATH $PATH $HOME/.local/bin
end

# Golang
if test -e /usr/local/go/bin
  set -gx PATH $PATH /usr/local/go/bin
end

# Cargo Rust
if test -e $HOME/.cargo/bin
  set -gx PATH $PATH $HOME/.cargo/bin
end

# Lua 5.4
if test -e /usr/lib/lua/5.4/
  set -gx PATH $PATH /usr/lib/lua/5.4/
end

# Node Package Manager
if test -e $HOME/.npm-global/bin
  set -gx PATH $PATH $HOME/.npm-global/bin
end


# Miniconda
# if test -e $HOME/.config/fish/functions/conda.fish
#     source $HOME/.config/fish/functions/conda.fish
# end

# set -gx PATH $PATH $TOOLBOX
# set -gx PATH $PATH $HOME/.config/jdk-18.0.2.1/bin
# set -gx PATH $PATH /usr/local/go $GOBIN
# set -gx PATH $PATH /home/linuxbrew/.linuxbrew/bin
# set -gx PATH $PATH $HOME/.gem/bin
