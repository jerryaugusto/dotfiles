# PATHs

# Bin
if test -e $HOME/.local/bin
  set -gx PATH $PATH $HOME/.local/bin
end

# Bun
set --export BUN_INSTALL "$HOME/.bun"
if test -e $BUN_INSTALL
  set -gx PATH $BUN_INSTALL/bin $PATH
end

# Golang
if test -e /usr/local/go/bin
  set -gx PATH /usr/local/go/bin $PATH
end

# Cargo Rust
if test -e $HOME/.cargo/bin
  set -gx PATH $HOME/.cargo/bin $PATH
end

# Linuxbrew
if test -e /home/linuxbrew/.linuxbrew/bin
  set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
end

# Lua 5.4
if test -e /usr/lib/lua/5.4/
  set -gx PATH /usr/lib/lua/5.4/ $PATH
end

# Node Package Manager
if test -e $HOME/.npm-global/bin
  set -gx PATH $HOME/.npm-global/bin $PATH
end

if test -e $HOME/.local/share/pnpm/pnpm
  set -gx PNPM_HOME "/home/araujo/.local/share/pnpm"
  if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
  end
end


# Miniconda
# if test -e $HOME/.config/fish/functions/conda.fish
#     source $HOME/.config/fish/functions/conda.fish
# end

# set -gx PATH $PATH $TOOLBOX
# set -gx PATH $PATH $HOME/.config/jdk-18.0.2.1/bin
# set -gx PATH $PATH /usr/local/go $GOBIN
# set -gx PATH $PATH $HOME/.gem/bin
