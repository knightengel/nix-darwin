{ config, lib, pkgs, ... }:

{
  networking.computerName = "engel";
  networking.hostName = "engel";
  system.stateVersion = 4;
  system.primaryUser = "engel";

  ids.gids.nixbld = 350;

  nix = {
    enable = true;
    settings.experimental-features = [ "nix-command" "flakes" ];
    optimise.automatic = true;
  };

  users.users.engel = {
    name = "engel";
    home = "/Users/engel";
  };

  programs.zsh.enable = true;

  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
  };

  services.skhd.enable = true;

  services.jankyborders = {
    enable = true;

    width = 6.0;
    style = "round";
    hidpi = true;

    active_color = "0xff8b0000";
    inactive_color = "0xffe1e3e4";

    # для лучшей совместимости с yabai
    ax_focus = true;

    # по желанию
    # blacklist = [ "System Settings" "Calculator" ];
    # whitelist = [ "WezTerm" "Safari" "Finder" ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.engel = import ./home.nix;
  };
}
