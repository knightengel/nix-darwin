{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    nodejs
    htop
    eza
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
    alejandra
  ];
}
