{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    htop
    eza
    tree
    jq
    iina
    ani-cli
    zoxide
    qbittorrent
    wezterm
    mpd
    rmpc
    alejandra
  ];
}
