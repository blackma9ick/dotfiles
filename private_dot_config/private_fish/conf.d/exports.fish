# options
export DISTCC_CMDLIST="$XDG_CONFIG_HOME/distcc/cmdlist.cfg"

export FZF_COMPLETION_TRIGGER='::'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow -E.cache -Egames -E.git -E.local/share -E.local/state -E.local/texlive -E.mozilla -E.steam -EAndroid -Enode_modules'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GPG_TTY="$TTY"

# export INFOPATH="$INFOPATH":"$HOME"/.local/texlive/2024/texmf-dist/doc/info
# export MANPATH="$MANPATH":"$HOME"/.local/texlive/2024/texmf-dist/doc/man

export _ZO_ECHO=0
export _ZO_EXCLUDE_DIRS=$HOME

export ZSTD_CLEVEL=7
export ZSTD_NBTHREADS=16

# umu-launcher
# export PROTONPATH='/usr/share/steam/compatibilitytools.d/proton-ge-custom'

export WINE_PREFIXES="$HOME/.prefixes"

# theme
switch (bash $HOME/.local/bin/kde-query-colorscheme)
    case dark
        export GLAMOUR_STYLE='Dark'
        export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
    case light
        export GLAMOUR_STYLE='Light'
        export FZF_DEFAULT_OPTS="
	--color=fg:#797593,bg:#faf4ed,hl:#d7827e
	--color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
	--color=border:#dfdad9,header:#286983,gutter:#faf4ed
	--color=spinner:#ea9d34,info:#56949f
	--color=pointer:#907aa9,marker:#b4637a,prompt:#797593"
end
