if status is-interactive
    if not functions -q fisher
        # Fisher can overwrite fish_plugins when installing.
        # See <https://github.com/jorgebucaran/fisher/pull/799>
        echo '[dotfiles] Backing up fish_plugins' >&2
        cp $__fish_config_dir/fish_plugins $__fish_config_dir/fish_plugins~
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    end

    switch (bash $HOME/.local/bin/kde-query-colorscheme)
        case light
            fish_config theme choose "Rosé Pine Dawn"
        case dark
            fish_config theme choose "Rosé Pine"
    end

    bind --mode insert ctrl-space accept-autosuggestion

    set fish_cursor_insert underscore blink

    set --global tide_character_color normal
    set --global tide_character_icon '>'
    set --global tide_character_vi_icon_default v
    set --global tide_character_vi_icon_replace '^'
    set --global tide_character_vi_icon_visual V

    zoxide init --cmd j fish | source
    fzf --fish | FZF_ALT_C_COMMAND='' source
end
