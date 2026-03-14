{ ... }:

{
  imports = [
    ./modules/home/packages.nix
    ./modules/home/zsh.nix
    ./modules/home/zoxide.nix
    ./modules/home/p10k.nix
    ./modules/home/mpd.nix
    ./modules/home/rmpc.nix
    ./modules/home/yabai.nix
    ./modules/home/skhd.nix
    ./modules/home/wezterm.nix
    ./modules/home/nvim.nix
  ];

  home.stateVersion = "25.05";
  home.username = "engel";
  home.homeDirectory = "/Users/engel";

  programs.home-manager.enable = true;
}
