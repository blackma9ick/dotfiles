# Use aliases.
# @fish-lsp-disable 2002

function chezmoi-cd
    cd $(chezmoi source-path)
end

function mkj
    mkdir $1 &>/dev/null || true
    j $1
end

# Shortcuts
set eza_flags '--long --color-scale=size --color-scale-mode=fixed \
                --icons=auto --group-directories-first --binary \
                --no-user'

alias a="$EDITOR"
alias cz='chezmoi'
alias czcd='chezmoi-cd'
alias f='fd'
alias ff='rg'
alias g='git'
alias gg='lazygit'
alias h='handlr'
alias ho='handlr open'
alias jctl='journalctl'
alias job='fg'
#     j='zoxide query', defined in config.fish
alias jj='ji'
alias k='clear -x' # does not clear the scrollback buffer
alias kk='clear'
alias kpxc='keepassxc-cli'
alias ls="eza $eza_flags"
alias nc='ncmpcpp'
alias neofetch='fastfetch'
alias p='pacman'
alias pac='pacman'
alias pp='paru'
alias sctl='systemctl'
alias sudo='sudo ' # prevents some problems
alias tree="eza $eza_flags --tree --level=2 --git --git-repos --no-filesize \
                           --no-time"
alias uctl='systemctl --user'
alias juctl='journalctl --user'
alias ujctl='journalctl --user'

# Configuration
alias btop='btop -p 1'
alias info='info --vi-keys'
alias namcap='namcap --info'
alias nccat='ncmpcpp --quiet --current-song="[%n] %a - %t"'
alias scdl='scdl -c --opus --no-playlist-folder --original-art --addtofile'

#  Dotfiles
alias dotbin='git --git-dir="$HOME"/.local/bin/.git --work-tree="$HOME/.local/bin"'
alias dotcfg='git --git-dir="$XDG_CONFIG_HOME"/.git --work-tree="$XDG_CONFIG_HOME"'
alias dotconfig='dotcfg'
alias ggbin='gg --git-dir="$HOME"/.local/bin/.git --work-tree="$HOME/.local/bin"'
alias ggcfg='gg --git-dir="$XDG_CONFIG_HOME"/.git --work-tree="$XDG_CONFIG_HOME"'
alias ggconfig='gg --git-dir="$XDG_CONFIG_HOME"/.git --work-tree="$XDG_CONFIG_HOME"'

# vi: set nowrap:
