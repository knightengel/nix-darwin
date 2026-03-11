{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/home/packages.nix
    ./modules/home/zsh.nix
    ./modules/home/mpd.nix
    ./modules/home/rmpc.nix
    ./modules/home/yabai.nix
    ./modules/home/skhd.nix
  ];

  home.stateVersion = "25.05";
  home.username = "engel";
  home.homeDirectory = "/Users/engel";

  programs.home-manager.enable = true;
}
