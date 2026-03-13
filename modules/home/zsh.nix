{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
      styles = {
        "command" = "fg=#d80000";
        "alias" = "fg=#d80000";
        "builtin" = "fg=#d80000";
        "unknown-token" = "fg=#1d2433";
        "precommand" = "fg=#cd5c5c";
      };
    };

    enableCompletion = true;

    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
    };

    shellAliases = {
      ls = "eza --icons=always";
      ll = "eza -la --icons=always";
    };

    profileExtra = ''
      setopt share_history
      setopt hist_expire_dups_first
      setopt hist_ignore_dups
      setopt hist_verify
    '';

    initContent = lib.mkMerge [
      (lib.mkBefore ''
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '')
      (lib.mkAfter ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

        eval "$(zoxide init zsh)"

        bindkey '^[[A' history-search-backward
        bindkey '^[[B' history-search-forward
      '')
    ];

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };
}
