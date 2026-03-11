{ config, pkgs, lib, ... }:

{
  home.stateVersion = "25.05";
  home.username = "engel";
  home.homeDirectory = "/Users/engel";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    nodejs
    htop
    eza
    neovim
    tree
    jq
    rustup
    iina
    ani-cli
    zoxide
    qbittorrent
    python314
    wezterm
    mpd
    rmpc
  ];

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
      py = "python3";
      ls = "eza --icons=always";
      cd = "z";
      nixupdateconf = "darwin-rebuild switch --flake ~/nix#engel";
      ll = "eza -la --icons=always";
      neofetch = "neofetch --source ~/Downloads/Aphex_Twin_logo_ASCII.txt";
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

  xdg.configFile."yabai/yabairc" = {
    executable = true;
    text = ''
      #!/usr/bin/env sh

      yabai -m config layout bsp

      yabai -m config top_padding    12
      yabai -m config bottom_padding 12
      yabai -m config left_padding   12
      yabai -m config right_padding  12
      yabai -m config window_gap     12

      yabai -m config mouse_follows_focus off
      yabai -m config focus_follows_mouse autoraise
      yabai -m config window_placement second_child
      yabai -m config window_shadow on

      echo "yabai configuration loaded.."
    '';
  };

  xdg.configFile."skhd/skhdrc" = {
    executable = true;
    text = ''
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east

      alt - f : yabai -m window --toggle zoom-parent
      alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2

      shift + alt - r : launchctl kickstart -k "gui/$(id -u)/org.nixos.yabai"
      shift + alt - b : launchctl kickstart -k "gui/$(id -u)/org.nixos.jankyborders"
    '';
  };
}
