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

  # Вся настройка home-manager теперь живёт только здесь
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    
    # Прямой импорт файла home.nix
    users.engel = import ./home.nix;
  };
}

