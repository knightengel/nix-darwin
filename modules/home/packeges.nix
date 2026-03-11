{ pkgs, ... }:

{
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
}
