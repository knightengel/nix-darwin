{  config, pkgs, lib, ... }:

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
    yabai
    wezterm
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    history = {
    size = 10000;
    save = 10000;
    path = "${config.home.homeDirectory}/.zsh_history";
    };
    
    shellAliases = {
      py = "python3";
      ls =  "eza --icons=always";
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
}
